/*
AUTHOR:
Pascal Kollie
PURPOSE:
A virtual private cloud (VPC) is a virtual network dedicated to your AWS account. It is logically isolated from other virtual networks in the AWS Cloud. You can launch your AWS resources, such as Amazon EC2 instances, into your VPC.
When you create a VPC, you must specify a range of IPv4 addresses for the VPC in the form of a Classless Inter-Domain Routing (CIDR) block; for example, 10.0.0.0/16. This is the primary CIDR block for your VPC. For more information about CIDR notation, see RFC 4632.
The following diagram shows a new VPC with an IPv4 CIDR block, and the main route table.
for more information "https://www.terraform.io/docs/providers/aws/r/vpc.html#instance_tenancy"
*/

resource "aws_vpc" "ccp-aws-vpc" {
  cidr_block       = "${var.vpc-cider-block}"
  instance_tenancy = "${var.vpc_instance_tenancy}"

  tags = {
    Name = "${var.environment_type}"
    Contact = "${var.contact}"
  }
}