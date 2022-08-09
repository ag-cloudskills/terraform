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
# Create EIP
resource "aws_eip" "lb" {
}

# Create S3 bucket
resource "aws_s3_bucket" "mybucket" {
    bucket = "my-tf-test-bucket-arcgis-drives"
  
}
# output eip
output "eip" {
  value = aws_eip.lb.public_ip
}
# output s3 bucket
output "s3bucket" {
    value = aws_s3_bucket.mybucket.bucket_domain_name 
}
