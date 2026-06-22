# provider.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"   # Use latest stable AWS provider
    }
  }

  required_version = ">= 1.5.0"
}

provider "aws" {
  region  = "us-east-1"   # Change to your preferred region
  profile = "default"     # Uses AWS CLI profile (from ~/.aws/credentials)
}
