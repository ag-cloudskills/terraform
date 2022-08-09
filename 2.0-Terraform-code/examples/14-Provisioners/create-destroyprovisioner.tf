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

resource "aws_security_group" "allow_ssh" {
  name = "allow_ssh"
  description = "allow ssh inbound traffic"
  
  ingress {
    description = "ssh to ec2"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "outbound"
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

}


# Launch the EC2
resource "aws_instance" "myec2" {
  ami           = "ami-07620139298af599e"
  instance_type = "t2.micro"
  key_name = "terraformtest"
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name = "firstec2"
    Createdby = "terraform"
  }

  provisioner "remote-exec" {
    inline = [
      "sudo yum -y install nano",
    ]
  }
  provisioner "remote-exec" {
    when = destroy
    inline = [
      "sudo yum -y remove nano",
    ]
  }

connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("./terraformtest.pem")
    host     = self.public_ip
  }
  

}

