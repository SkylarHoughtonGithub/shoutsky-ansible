##Generate RSA Key
variable "key_name" {
    type = string
    default = "TFKeyPair"
}

##EC2 Setup Vars##
data "aws_ami" "AmazonLinux" {
    most_recent = true
    owners = ["515798882395"]
    
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}

variable "instance" {
    type = string
    default = "t2.micro"
  
}

##VPC Setup Vars##

variable "vpc_cidr" {
    type = string
    default = "192.168.0.0/16"
}

variable "psn_cidr" {
    type = string
    default = "192.168.100.0/24"
}

