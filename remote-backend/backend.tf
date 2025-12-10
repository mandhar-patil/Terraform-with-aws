terraform {
  backend "s3" {
    bucket         = "eks-terraform-state1"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "eks-terraform-state-table"
    encrypt        = true
  }
}

