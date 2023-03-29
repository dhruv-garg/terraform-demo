provider "aws" {
  assume_role {
    role_arn     = "arn:aws:iam::430288206927:role/TerraformTestRole"
    session_name = "TestSession"
    external_id  = "EXTERNAL_ID"
  }
}

resource "aws_security_group" "http_access" {
  name        = "http_access"
  description = "Allow HTTP inbound traffic"

  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH ACcess"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "http_access"
  }
}

resource "aws_instance" "my_vm" {
  ami           = "ami-0c3157ff674c2918d"
  instance_type = "t2.micro"

  key_name = "TestKP-Provisioner"
  security_groups = [aws_security_group.http_access.name]

  provisioner "file" {
    source      = "./test-provisioner.txt"
    destination = "/home/ubuntu/test-provisioner.txt"
  }
  
  provisioner "remote-exec" {
    inline = [
      "chmod 777 ./test-provisioner.txt"
    ]
  }

  connection {
    type        = "ssh"
    host        = self.public_ip
    user        = "ubuntu"
    private_key = file("./TestKP-Provisioner.pem")
    timeout     = "4m"
  }
}
