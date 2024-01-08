variable "region" {
  description = "The AWS region in which to deploy the Amplify app."
  type        = string
  default     = "us-west-2"
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
