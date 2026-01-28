data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket         = "nishant-terraform-state-123"
    key            = "aws/vpc/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
  }
}

data "terraform_remote_state" "eks" {
  backend = "s3"
  config = {
    bucket         = "nishant-terraform-state-123"
    key            = "aws/eks/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
  }
}