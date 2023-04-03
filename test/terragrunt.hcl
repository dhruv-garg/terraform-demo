include "root" {
  path = find_in_parent_folders()
}

terraform {
  source = "../modules/aws-s3-static-website-bucket"
}

inputs = {
  tags = {
       Terraform   = "True"
       Environment = "test"
    }
}
