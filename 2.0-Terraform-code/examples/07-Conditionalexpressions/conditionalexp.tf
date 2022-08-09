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

variable "username" {
  type = list
  default = ["user1","user2","user3"]
  
}

variable "envisprod" {}

resource "aws_instance" "dev" {
  ami = ""
  instance_type = "t2.nano"
  count = var.envisprod == false ? 3:0
}
resource "aws_instance" "prod" {
  ami = ""
  instance_type = "t2.medium"
  count = var.envisprod == true ? 5:0
}
