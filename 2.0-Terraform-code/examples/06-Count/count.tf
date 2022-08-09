# Configure the AWS Provider
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}
# Configure the AWS Region
provider "aws" {
  region = "ap-southeast-2"
}   

resource "aws_instance" "myec2" {
  ami = "ami-09b42976632b27e9b"
  instance_type = "t2.nano"
  count = 4
}