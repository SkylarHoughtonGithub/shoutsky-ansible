
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
