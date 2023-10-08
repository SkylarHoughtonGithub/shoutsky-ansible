# TODO: modularize vpc resourcs
# TODO: expose vpc and subnet id in deployment
resource "aws_vpc" "terraform-vpc" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "tf_vpc"
  }
}

resource "aws_subnet" "privatesubnet" {
  vpc_id            = aws_vpc.terraform-vpc.id
  cidr_block        = var.psn_cidr
  availability_zone = "us-east-2a"

  tags = {
    Name = "tf_psn"
  }
}
