##VPC Setup Vars##

variable "vpc_cidr" {
  type    = string
  default = "192.168.0.0/16"
}

variable "psn_cidr" {
  type    = string
  default = "192.168.100.0/24"
}

