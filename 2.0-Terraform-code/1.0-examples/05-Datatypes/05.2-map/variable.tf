variable "types" {
    type = map
    default = {
        ap-southeast-2 = "t2.nano"
        us-east-1 = "m5.large"
        ap-south-1 = "t2.medium"
    }
}