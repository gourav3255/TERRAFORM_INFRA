terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.region
   access_key = "AKIAZXMJNGUPLBTWZ6WW"
  secret_key = "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"
}