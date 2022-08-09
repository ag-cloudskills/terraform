

variable "sg_ports" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8200, 8300, 8301, 8400]
}

resource "aws_security_group" "dynamic_sg" {
  name = "dynamic-sg"


  dynamic "ingress" {
    for_each = var.sg_ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }

}

 