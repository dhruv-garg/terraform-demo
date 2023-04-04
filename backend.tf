terraform {
  backend "s3" {
    encrypt        = true
    bucket         = "dhruvgarg074-state"
    dynamodb_table = "terraform-state-lock-dynamo"
    key            = "terraform.tfstate"
    region         = "us-east-1"
  }
}
