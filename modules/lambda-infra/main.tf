provider "aws" {
  region = "ap-south-1"
}

resource "aws_iam_role" "lambda_role" {
name   = var.lambda_role_name
assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": "sts:AssumeRole",
     "Principal": {
       "Service": "lambda.amazonaws.com"
     },
     "Effect": "Allow",
     "Sid": ""
   }
 ]
}
EOF
}

resource "aws_iam_policy" "iam_policy_for_lambda" {
 
 name         = "aws_iam_policy_for_terraform_aws_lambda_role"
 path         = "/"
 description  = "AWS IAM Policy for managing AWS lambda role"
 policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Action": [
       "logs:CreateLogGroup",
       "logs:CreateLogStream",
       "logs:PutLogEvents"
     ],
     "Resource": "arn:aws:logs:*:*:*",
     "Effect": "Allow"
   }
 ]
}
EOF
}

resource "aws_iam_role_policy_attachment" "attach_iam_policy_to_iam_role" {
 role        = aws_iam_role.lambda_role.name
 policy_arn  = aws_iam_policy.iam_policy_for_lambda.arn
}

#data "archive_file" "zip_the_python_code" {
#type        = "zip"
#source_dir  = "${path.module}/python-app/"
#output_path = "${path.module}/python-app/python-app.zip"
#}

resource "aws_s3_bucket" "python_code" {
  bucket = var.s3_bucket_name  # Replace with your desired bucket name
}

resource "aws_s3_bucket_ownership_controls" "lambda_bucket_ownership" {
  bucket = aws_s3_bucket.python_code.id
  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_acl" "lambda_bucket_acl" {
  depends_on = [aws_s3_bucket_ownership_controls.lambda_bucket_ownership]
  bucket = aws_s3_bucket.python_code.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "python_code_version" {
  bucket = aws_s3_bucket.python_code.id

  versioning_configuration {
    status = "Enabled"
  }
}

# S3 object example
resource "aws_s3_object" "python_sample" {
  bucket = aws_s3_bucket.python_code.id
  key    = var.s3_key
  source = "${path.module}/python-app/python-app.zip"  # Local path of the file to upload
  server_side_encryption = "AES256"
}

resource "aws_lambda_function" "test_lambda_func" {
//filename                       = "${path.module}/python-app/python-app.zip"
s3_bucket                      = aws_s3_bucket.python_code.id
s3_key                         = var.s3_key
function_name                  = var.lambda_function_name
role                           = aws_iam_role.lambda_role.arn
handler                        = "index.lambda_handler"
runtime                        = "python3.8"
depends_on                     = [aws_iam_role_policy_attachment.attach_iam_policy_to_iam_role]
}

## AWS API-Gateway

resource "aws_iam_role_policy_attachment" "api_gateway_access_policy" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/AWSAppGatewayInvokeFullAccess"  # For custom policies
}

# App Gateway
resource "aws_api_gateway_rest_api" "my_api" {
  name = var.api_gateway_name
}

resource "aws_api_gateway_resource" "endpoint_resource" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  parent_id   = aws_api_gateway_rest_api.my_api.root_resource_id
  path_part   = var.api_gateway_path  # Dynamic path based on generated endpoint name
}

resource "aws_api_gateway_method" "method" {
  rest_api_id   = aws_api_gateway_rest_api.my_api.id
  resource_id   = aws_api_gateway_resource.endpoint_resource.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "endpoint_integration" {
  rest_api_id = aws_api_gateway_rest_api.my_api.id
  resource_id = aws_api_gateway_resource.endpoint_resource.id
  http_method             = aws_api_gateway_method.method.http_method
  type        = "AWS_PROXY"
  integration_http_method = "ANY"
  uri        = aws_lambda_function.test_lambda_func.invoke_arn
}