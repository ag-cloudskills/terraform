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
  instance_type = "t2.micro"
  key_name = "terraformtest"

  tags = {
    Name = "firstec2"
    Createdby = "terraform"
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file("./terraformtest.pem")
    host     = self.public_ip
  }
  
  provisioner "remote-exec" {
    inline = [
      "sudo amazon-linux-extras install -y nginx1",
      "sudo systemctl start nginx",
    ]
  }

}

