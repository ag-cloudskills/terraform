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
# Create EIP
resource "aws_eip" "lb" {
    vpc = true
    depends_on =[null_resource.health_check]
}

resource "null_resource"  "health_check" {

    provisioner "local-exec" {
        command = "curl https://google.com"
    
    }
}
