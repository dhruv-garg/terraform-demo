terraform {
  required_providers {
    test = {
      source = "terraform.io/builtin/test"
    }
  }
}

resource "test_assertions" "ec2" {
  component = "ec2"
  equal "name" {
    description = "Check ec2 name"
    got         = aws_instance.tomcat_instance.name
    want        = "tomcat_instance"
  }
}
