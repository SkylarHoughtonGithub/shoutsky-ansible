resource "aws_vpc" "terraform-vpc" {
    cidr_block = var.vpc_cidr
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
    Name = "tf_vpc"
  }
}

resource "aws_subnet" "privatesubnet" {
    vpc_id = aws_vpc.terraform-vpc.id
    cidr_block = var.psn_cidr
    availability_zone = "us-east-2a"

    tags = {
    Name = "tf_psn"
  }
}

resource "aws_security_group" "tf_sg" {
  name = "tf-sg"
  description = "Created with Terraform. Allows ICMP, HTTP, HTTPS and SSH"
  vpc_id = aws_vpc.terraform-vpc.id

  ingress {
      from_port = -1
      to_port = -1
      protocol = "icmp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.terraform-vpc.id

    tags = {
    Name = "tf_igw"
  }
}

resource "aws_route_table" "terraformRT" {
    vpc_id = aws_vpc.terraform-vpc.id
    route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
    }

    tags = {
    Name = "tf_rt"
  }
}