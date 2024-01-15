variable "region" {
  description = "The AWS region in which to deploy the Amplify app."
  type        = string
  default     = "ap-south-1"
}

variable "name" {
  description = "The name of the Amplify app."
  type        = string
  default     = "amplify-app"
}

variable "repository" {
  description = "The GitHub repository URL for the Amplify app."
  type        = string
  default     = "https://github.com/kuldeep-bnxt/amplify-app"
}

variable "domain_name" {
  type        = string
  default     = "awsamplifyapp.com"
  description = "AWS Amplify Domain Name"
}