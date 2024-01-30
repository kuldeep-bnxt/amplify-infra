provider "aws" {
  region = var.region
}

resource "aws_ssm_parameter" "db_user" {
  name = "/my-app/database/user"
  type = "String"
  value = var.db_user
}

resource "aws_ssm_parameter" "db_password" {
  name = "/my-app/database/password"
  type = "SecureString"
  value = var.database_password
}