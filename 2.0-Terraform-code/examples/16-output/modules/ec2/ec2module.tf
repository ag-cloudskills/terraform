/*terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}
# Configure the AWS Provider
*/

resource "aws_instance" "myec2" {
    ami = "ami-07620139298af599e"
    instance_type = var.instance_type
   # instance_type = "t2.micro"
    vpc_security_group_ids = var.vpcsg
  
}

variable "instance_type" {
    default = "t2.micro"
  
}

variable "vpcsg" {
  
}