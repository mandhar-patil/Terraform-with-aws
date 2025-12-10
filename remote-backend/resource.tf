# S3 bucket for remote state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "eks-terraform-state1"  # Must be globally unique
  acl    = "private"

  versioning {
    enabled = true
  }
}

# DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_lock" {
  name         = "eks-terraform-state-table"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}

