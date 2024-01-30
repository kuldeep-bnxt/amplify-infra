terraform {
  backend "s3" {
    bucket         = "amplify-infra-poc"
    key            = "terraform-state/terraform.tfstate"
    region         = "ap-south-1"
    encrypt        = true
  }
}