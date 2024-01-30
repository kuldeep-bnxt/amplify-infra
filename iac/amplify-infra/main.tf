module "amplify_infra" {
  source = "../../modules/amplify"
  region = var.region
  access_token = var.access_token
  name = var.name
  repository = var.repository
  domain_name = var.domain_name
  environment_name = var.environment_name
  deployment_artifacts = var.deployment_artifacts
  stack_name = var.stack_name
  branch_name = var.branch_name
  environment_variables = var.environment_variables
}