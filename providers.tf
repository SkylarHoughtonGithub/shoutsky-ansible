terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.43.0"
    }
  }
}

provider "aws" {
  region     = "us-east-2"
  access_key = "AKIAXZHQ6I2H2W7WO5H3"
  secret_key = "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"
}

