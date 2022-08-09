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
  instance_type = var.ec2instancetype

  tags = {
    Name = "tfec2"
    Createdby = "terraform"
  }
}