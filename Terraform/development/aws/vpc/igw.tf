resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.terraform-vpc.id

    tags = {
    Name = "tf_igw"
  }
}
