terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}

# terraform taint aws_security_group.demo_sg
resource "aws_security_group" "demo_sg" {
  name = "sample-sg"

  ingress {
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8300
    to_port     = 8301
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 8400
    to_port     = 8401
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}