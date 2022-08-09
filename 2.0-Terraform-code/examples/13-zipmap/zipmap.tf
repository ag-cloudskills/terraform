terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.22.0"
    }
  }
}

resource "aws_iam_user" "user" {
    name = "iamuser.${count.index}"
    count = 3
    path = "/system/"
  
}


output "arns" {
  value = aws_iam_user.user[*].arn
}

output "iam_name" {
  value = aws_iam_user.user[*].name
}

output "combined" {
  value = zipmap(aws_iam_user.user[*].name,aws_iam_user.user[*].arn)
  
}