module "lambda-api-gateway" {
  source = "../../modules/lambda-infra"
 // region = var.region
  lambda_role_name = var.lambda_role_name
  lambda_function_name = var.lambda_function_name
  s3_bucket_name = var.s3_bucket_name
  s3_key = var.s3_key
  api_gateway_name = var.api_gateway_name
  api_gateway_path = var.api_gateway_path
}