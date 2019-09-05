
/*
AUTHOR:
Pascal Kollie
PURPOSE:
Amazon Elastic Compute Cloud forms a central part of Amazon.com's cloud-computing platform, 
Amazon Web Services, by allowing users to rent virtual computers on which to run their own 
computer applications.
*/
resource "aws_instance" "ccp-aws-instance" {
  count         = "${var.ec2_count}"
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  subnet_id     = "${var.subnet_id}"
  availability_zone = "${var.ec2_az}"
  security_groups = "${var.sg_id}"

  tags = {
    Name = "${var.environment_type}"
    Contact = "${var.contact}"
  }
}