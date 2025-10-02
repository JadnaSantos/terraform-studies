locals {
  project_name = "terraform-studies"
  environment  = "dev"
  aws_region   = "us-east-1"

  lambda_function_name = "${local.project_name}-time-api"
  arch                 = "arm64"

  common_tags = {
    Application = "TimeApi"
    Owner       = "DevTeam"
  }
}