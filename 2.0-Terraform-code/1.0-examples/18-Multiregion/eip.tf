resource "aws_eip" "eip01" {
    vpc = true
  
}

resource "aws_eip" "eip02" {
    provider = aws.mumbai
    vpc = true
  
}