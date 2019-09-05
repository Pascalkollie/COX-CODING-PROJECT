output "vpc_id" {
  value = "${aws_vpc.ccp-aws-vpc.id}"
}
output "vpc_codr" {
  value = "${aws_vpc.ccp-aws-vpc.cidr_block}"
}
output "subnet_id_1" {
  value = "${aws_subnet.ccp-aws-subnet-1.id}"
}
output "subnet_id_2" {
  value = "${aws_subnet.ccp-aws-subnet-2.id}"
}
output "security_group_id" {
  value = "${aws_security_group.ccp-sg.id}"
}