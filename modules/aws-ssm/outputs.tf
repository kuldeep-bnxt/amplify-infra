output "db_user" {
  value = aws_ssm_parameter.db_user.name
  description = "The name of the database user parameter"
}

output "db_password_arn" {
  value = aws_ssm_parameter.db_password.arn
  description = "The ARN of the database password parameter"
}