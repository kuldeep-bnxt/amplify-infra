variable "lambda_role_name" {
  type = string
  default = "Test_Lambda_Function_Role"
}

variable "lambda_function_name" {
  type = string
  default = "Test_Lambda_Function"
}

variable "s3_bucket_name" {
  type = string
  default = "lambdas-test-code"
}

variable "s3_key" {
  type = string
  default = "python-app.zip"
}

variable "api_gateway_name" {
  type = string
  default = "my-test-api"
}

variable "api_gateway_path" {
  type = string
  default = "/test"
}