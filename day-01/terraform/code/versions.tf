terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.26.0"
    }
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.111.0"
    }
    vault = {
      source = "hashicorp/vault"
    }
    template = {
      source = "hashicorp/template"
    }
    null = {
      source = "hashicorp/null"
    }
  }
  required_version = ">= 0.15"
}

provider "aws" {
  region = "eu-west-1"


  assume_role {
    role_arn     = "arn:aws:iam::<aws_account_number>:role/github_actions_oidc_role"
    session_name = "${terraform.workspace}_SESSION"
  }
}
