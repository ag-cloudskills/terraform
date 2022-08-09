terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}

locals {
  time = formatdate("DD MMM YYYY hh:mm: ZZZ",timestamp())
}
# Launch the EC2

resource "aws_instance" "myec2" {
  # function loookup (map,key,default)
  ami = lookup(var.ami,var.region)
  instance_type = "t2.micro"
  count = 2

# function element(list,index)
  tags = {
    Name = element(var.tags,count.index)
  }
}

/*
resource "aws_key_pair" "key" {
  key_name = "login-key"
  public_key = file("${path.module}/id_rsa.pub")
  
}

*/
output "timestamp" {
  value = local.time
  
}