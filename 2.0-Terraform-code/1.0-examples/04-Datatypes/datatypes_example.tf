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
# Configure the AWS IAM user
resource "aws_iam_user" "lb" {
  name = var.username
  path = "/system/"

  tags = {
    tag-key = "demoUser"
  }
}