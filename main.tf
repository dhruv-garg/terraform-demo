terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  assume_role {
    role_arn     = "arn:aws:iam::430288206927:role/TerraformTestRole"
    session_name = "TestSession"
    external_id  = "EXTERNAL_ID"
  }
}
