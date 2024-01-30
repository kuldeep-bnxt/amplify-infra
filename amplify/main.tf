provider "aws" {
  region = var.region
}

resource "aws_amplify_app" "amplify_app" {
  name       = var.name
  repository = var.repository

//  oauth_token = "example-token"  # Make sure to hide this in a secure place!

  access_token = "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"       # Same here, secure this properly!

  build_spec = <<EOF
version: 0.1
frontend:
  phases:
    preBuild:
      commands:
        - echo Installing dependencies...
        - npm install
    build:
      commands:
        - echo Build started on `date`
        - echo Building the app...
        - npm run build
  artifacts:
    baseDirectory: /
    files:
      - '**/*'
  cache:
    paths:
      - node_modules/**/*
EOF

}

resource "aws_amplify_backend_environment" "amplify_backend" {
  app_id           = aws_amplify_app.amplify_app.id
  environment_name = "dev"

  deployment_artifacts = "app-deployment"
  stack_name           = "amplify-app-deployment"
}

resource "aws_amplify_branch" "master" {
  app_id      = aws_amplify_app.amplify_app.id
  branch_name = "main"
  
  environment_variables = {
    TEST = "AMPLIFY_APP"
  }
}

//resource "aws_amplify_domain_association" "domain_association" {
//  app_id      = aws_amplify_app.amplify_app.id
//  domain_name = var.domain_name
//  wait_for_verification = false
//
//  sub_domain {
//    branch_name = aws_amplify_branch.master.branch_name
//    prefix      = "main"
//  }
//}