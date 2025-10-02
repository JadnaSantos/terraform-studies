terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
    }
  }

  required_version = ">= 1.3.7"
}

provider "aws" {
  region  = local.aws_region

  default_tags {
    tags = {
      app = local.project_name
      environment = local.environment
    }
  }
}
