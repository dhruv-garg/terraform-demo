resource "aws_security_group" "http_access" {
  name        = "tomcat_access"
  description = "Allow HTTP inbound traffic"
  vpc_id      = module.vpc.vpc_id

  ingress {
    description = "HTTP Access"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    description = "Custom Tomcat Access"
    from_port   = 8080
    to_port     = 8080
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

resource "aws_instance" "tomcat_instance" {
  ami             = "${var.instance_ami}"
  instance_type   = "${var.instance_type}"
  key_name        = "${var.key_name}"
  subnet_id       = module.vpc.public_subnets[0]
  security_groups = [aws_security_group.http_access.id]
  user_data       = "${file("install_tomcat.sh")}"
}
