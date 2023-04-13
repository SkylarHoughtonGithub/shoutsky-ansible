resource "tls_private_key" "new_key" {
  algorithm = "RSA"
}

resource "aws_key_pair" "generated_key" {
  key_name = var.key_name
  public_key = "${tls_private_key.new_key.public_key_openssh}"
}

##Create EC2 Instance
resource "aws_instance" "tf_ec2_instance" {
  ami = data.aws_ami.AmazonLinux.id
  instance_type= var.instance
  key_name = "${aws_key_pair.generated_key.key_name}"
  subnet_id = aws_subnet.privatesubnet.id
  vpc_security_group_ids = [ "${aws_security_group.tf_sg.id}" ]

  tags = {
  Name = "tf_ec2_instance"
  }
}


