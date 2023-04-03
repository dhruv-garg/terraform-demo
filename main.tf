terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.0.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
  assume_role {
    role_arn     = "arn:aws:iam::430288206927:role/TerraformTestRole"
    session_name = "TestSession"
    external_id  = "EXTERNAL_ID"
  }
}

 resource "tls_private_key" "example" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "terraform-demo" {
  key_name   = "terraform-demo"
  public_key = tls_private_key.example.public_key_openssh
}

 resource "aws_instance" "terraform-instance" {
  ami               = "ami-0c3157ff674c2918d"
  instance_type     = "${var.instance_type}"
  availability_zone = "us-east-1a"
  key_name          = "${aws_key_pair.terraform-demo.key_name}"
  user_data = <<EOF
  #!/bin/bash
  sudo apt-get update
  sudo apt-get install -y apache2
  sudo systemctl start apache2
  sudo systemctl enable apache2
  echo "<h1>Deployed via Terraform</h1>" | sudo tee /var/www/html/index.html
  EOF
  tags = {
    Name = "terraform-instance"
  }
}

module "website_s3_bucket" {
  source      = "./modules/aws-s3-static-website-bucket"
  count       = 1
  bucket_name = "dhruv-garg-29-03-2023-${count.index}"
  tags        = {
		Terraform   = "True"
		Environment = "Dev"
		}
}

