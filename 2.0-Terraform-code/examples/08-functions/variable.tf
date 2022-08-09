# variable

variable "ami" {
    type = map
    default = {
        "us-east-2" = "ami-0b59bfac6be064b78"
        "ap-southeast-2" = "ami-09b42976632b27e9b"
    }
}

variable "region" {
    type = string
    default = "ap-southeast-2"
}

variable "tags" {
    type = list
    default = ["firstec2","secondec2"]  
}