variable "region" {
  description = "The AWS region in which to deploy the Amplify app."
  type        = string
  default     = "ap-south-1"
}

variable "access_token" {
  type      = string
  default   = "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"
  sensitive = true
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

variable "environment_name" {
  type = string
  default = "dev"
}

variable "deployment_artifacts" {
  type = string
  default = "app-deployment"
}

variable "stack_name" {
  type = string
  default = "amplify-app-deployment"
}

variable "branch_name" {
  type = string
  default = "main"
}

variable "environment_variables" {
  type = map(string)
  default = {
    TEST = "AMPLIFY_APP"
  }
}