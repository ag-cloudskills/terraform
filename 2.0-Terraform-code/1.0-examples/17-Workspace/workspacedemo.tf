provider "aws" {
  region = "ap-southeast-2"
}

resource "aws_instance" "ec2demo" {
  ami = "ami-07620139298af599e"
  instance_type = lookup(var.instance_type,terraform.workspace)
}

variable "instance_type" {
    type = map

    default = {
        default = "t2.nano"
        dev = "t2.micro"
        prod = "t2.large"
    }
  
}