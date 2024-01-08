output "amplify_arn" {
  value = aws_amplify_app.amplify_app.arn
}

output "amplify_default_domain" {
  value = aws_amplify_app.amplify_app.default_domain
}

output "amplify_id" {
  value = aws_amplify_app.amplify_app.id
}

//output "amplify_app_url" {
//  value = aws_amplify_domain_association.domain_association.domain_name
//}