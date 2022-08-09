

variable "sg_ports_itr" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [8200, 8300, 8301, 8400]
}

variable "sg_ports_itr_egress" {
  type        = list(number)
  description = "list of ingress ports"
  default     = [443, 80]
}

resource "aws_security_group" "dynamic_sg_iterator" {
  name = "dynamic-sg-iterator"


  dynamic "ingress" {
    for_each = var.sg_ports_itr
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }

  dynamic "egress" {
    for_each = var.sg_ports_itr_egress
    iterator = port
    content {
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]

    }
  }


}

 