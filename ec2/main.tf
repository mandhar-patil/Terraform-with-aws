# Get latest Ubuntu AMI
data "aws_ami" "os_image" {
  owners      = ["099720109477"]
  most_recent = true

  filter {
    name   = "state"
    values = ["available"]
  }

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/*amd64*"]
  }
}

# Create SSH Key Pair
resource "aws_key_pair" "deployer" {
  key_name   = "terra-automate-key2"
  public_key = file("terraf-key.pub")
}

# Use default VPC
resource "aws_default_vpc" "default" {}

# Security Group
resource "aws_security_group" "allow_user_to_connect" {
  name        = "allow_tls2"
  description = "Allow user to connect"
  vpc_id      = aws_default_vpc.default.id

  ingress {
    description = "Allow SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "mysecurity"
  }
}

# EC2 Instance
resource "aws_instance" "testinstance" {
  ami             = data.aws_ami.os_image.id
  instance_type   = "t3.micro"
  key_name        = aws_key_pair.deployer.key_name
  security_groups = [aws_security_group.allow_user_to_connect.name]

  tags = {
    Name = "Terra-Automate"
  }

  root_block_device {
    volume_size = 10
    volume_type = "gp3"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("terraf-key")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y apache2",
      "sudo systemctl start apache2",
      "sudo systemctl enable apache2",
      "sudo mkdir -p /var/www/html",
      "echo 'Hello from Terraform Provisioners!' | sudo tee /var/www/html/index.html"
    ]
  }
}

