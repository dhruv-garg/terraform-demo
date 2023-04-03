generate "versions" {
  path      = "versions.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
    terraform {
    required_providers {
      aws = {
        source  = "hashicorp/aws"
        version = "~>4.0"
      }
    }
  }
  EOF
}

inputs = {
  bucket_name = "dhruv-garg"
}
