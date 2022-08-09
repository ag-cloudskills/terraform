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
# Launch the EC2
resource "aws_instance" "myec2" {
  ami           = "ami-07620139298af599e"
  instance_type = "t2.micro"
}
# Create EIP
resource "aws_eip" "ec2" {
}
# Create association
resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.myec2.id
  allocation_id = aws_eip.ec2.id
}

# Create SG
resource "aws_security_group" "allow_tls" {
  name        = "ingressonly"

  ingress {
    description      = "TLS connection"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["${aws_eip.ec2.public_ip}/32"]
  }
}
# output
output "eip" {
  value = aws_eip.ec2.public_ip
}
output "ec2" {
  value = aws_instance.myec2.public_ip
}