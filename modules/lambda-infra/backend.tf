terraform {
  backend "s3" {
    bucket         = "lambda-func-state"
    key            = "lambda-state/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}