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

resource "aws_iam_user" "user" {
  name =  "awsuser.${count.index}"
  path = "/system/"
  count = 4
}