terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}
# Configure the AWS Provider
provider "aws" {
  region = "ap-southeast-2"
}

# Create SG
resource "aws_security_group" "allow_tls" {
  name        = "ingressonly"

  ingress {
    description      = "TLS connection"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = [var.corporatenw]
  }
ingress {
    description      = "TCP connection"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [var.corporatenw]
  }
ingress {
    description      = "ssh connection"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [var.corporatenw]
  }
}