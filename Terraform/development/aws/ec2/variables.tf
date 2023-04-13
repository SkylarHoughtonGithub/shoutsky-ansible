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

