resource "aws_security_group" "ec2-sg" {
    name = "myec2-sg"
  
  ingress {
    description = "allow sg for ssl connection"
    from_port = var.app_port
    to_port = var.app_port
    protocol = "tcp"
    cidr_blocks = ["10.0.0.0/8"]
  }

  egress {
    description = "allow connection for patch download"
    from_port =  var.app_port
    to_port =  var.app_port
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  } 
 
}

output "sg_id" {
    value = aws_security_group.ec2-sg.id
  
}

