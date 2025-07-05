terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

    backend "s3" {
    bucket = "not-so-simple-ecommerce-renan-dias-terraform-state-file"
    key    = "networking/terraform.tfstate"
    region = "us-east-1"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  assume_role {
    role_arn    = var.assume_role.role_arn
    external_id = var.assume_role.external_id
  }
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

