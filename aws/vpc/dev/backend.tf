terraform {
  backend "s3" {
    bucket         = "nishant-terraform-state-123"
    key            = "aws/vpc/dev/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
}
}