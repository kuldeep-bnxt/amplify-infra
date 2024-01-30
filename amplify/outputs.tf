output "amplify_arn" {
  value = aws_amplify_app.amplify_app.arn
}

output "amplify_default_domain" {
  value = aws_amplify_app.amplify_app.default_domain
}

output "amplify_id" {
  value = aws_amplify_app.amplify_app.id
}

output "backend_environment_id" {
  value = aws_amplify_backend_environment.amplify_backend.id
  description = "ID of the backend environment"
}

output "backend_environment_name" {
  value = aws_amplify_backend_environment.amplify_backend.environment_name
  description = "Name of the backend environment"
}

output "branch_id" {
  value = aws_amplify_branch.master.id
  description = "ID of the connected branch"
}

output "branch_name" {
  value = aws_amplify_branch.master.branch_name
  description = "Name of the connected branch"
}

//output "domain_name" {
//  value = aws_amplify_domain_association.domain_association.domain_name
//  description = "Domain name associated with the app"
//}

//output "subdomain" {
//  value = aws_amplify_domain_association.domain_association.sub_domain[0].prefix
//  description = "Subdomain prefix for the main branch"
//}

//output "amplify_app_url" {
//  value = aws_amplify_domain_association.domain_association.domain_name
//}