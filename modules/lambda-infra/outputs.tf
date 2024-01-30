output "lambda_function_arn" {
  value = aws_lambda_function.test_lambda_func.arn
}

output "lambda_function_invoke_arn" {
  value = aws_lambda_function.test_lambda_func.invoke_arn
}

output "iam_role_arn" {
  value = aws_iam_role.lambda_role.arn
}

output "iam_policy_arn" {
  value = aws_iam_policy.iam_policy_for_lambda.arn
}