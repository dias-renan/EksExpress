terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "not-so-simple-ecommerce-renan-dias-terraform-state-file"
    key            = "networking/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "not-so-simple-ecommerce-renan-dias-terraform-locking"
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  
  default_tags {
    tags = var.tags
  }
  assume_role {
    role_arn    = var.assume_role.role_arn
    external_id = var.assume_role.external_id
  }
}

