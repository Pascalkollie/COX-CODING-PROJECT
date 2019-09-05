/*
AUTHOR:
Pascal Kollie
PURPOSE:
VPC and Subnet Sizing for IPv4
When you create a VPC, you must specify an IPv4 CIDR block for the VPC. The allowed block size is 
between a /16 netmask (65,536 IP addresses) and /28 netmask (16 IP addresses). 
After you've created your VPC, you can associate secondary CIDR blocks with the VPC. 
For more information, see Adding IPv4 CIDR Blocks to a VPC.
for more information "https://www.terraform.io/docs/providers/aws/r/subnet.html"
*/

resource "aws_subnet" "ccp-aws-subnet-1" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet-cider-block-1}"
  availability_zone = "${var.subnet_az-1}"
  map_public_ip_on_launch = "${var.public_ip_on_launch}"

  tags = {
    Name = "${var.environment_type}"
    Contact = "${var.contact}"
  }
}
resource "aws_subnet" "ccp-aws-subnet-2" {
  vpc_id     = "${var.vpc_id}"
  cidr_block = "${var.subnet-cider-block-2}"
  availability_zone = "${var.subnet_az-2}"
  map_public_ip_on_launch = "${var.public_ip_on_launch}"

  tags = {
    Name = "${var.environment_type}"
    Contact = "${var.contact}"
  }
}