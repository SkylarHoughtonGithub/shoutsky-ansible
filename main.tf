data "aws_ami" "AmazonLinux" {
    most_recent = true
    owners = ["515798882395"]
    
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}

resource "aws_instance" "tf_ec2_instance" {
  ami = "${data.aws_ami.AmazonLinux.image_id}"
  instance_type= "t2.micro"

  tags = {
  Name = "tf_ec2_instance"
  }
}

data "aws_vpc" "default" {
  default = true
} 

resource "aws_vpc" "terraform-vpc" {
    cidr_block = "172.31.0.0/16"
    instance_tenancy = "default"

    tags = {
    Name = "tf_vpc"
  }
}

resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.terraform-vpc.id

    tags = {
    Name = "tf_igw"
  }
}

resource "aws_subnet" "privatesubnet" {
    vpc_id = aws_vpc.terraform-vpc.id
    cidr_block = "172.31.31.0/24"

    tags = {
    Name = "tf_psn"
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

resource "aws_default_vpc" "terraform-vpc" {
    tags = {
        Name = "tf_vpc"
    }
}
