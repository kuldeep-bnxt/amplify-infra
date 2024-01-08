provider "aws" {
  region = var.region
}

resource "aws_amplify_app" "amplify_app" {
  name       = var.name
  repository = var.repository

//  oauth_token = "example-token"  # Make sure to hide this in a secure place!

//  access_token = "example"       # Same here, secure this properly!

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