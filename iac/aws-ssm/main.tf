module "aws-ssm-parameter" {
  source = "../../modules/aws-ssm"
  region = var.region
  db_user = var.db_user
  database_password = var.database_password
}