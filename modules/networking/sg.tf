

/*
AUTHOR:
Pascal Kollie
PURPOSE:
A security group acts as a virtual firewall for your instance to control inbound and 
outbound traffic. When you launch an instance in a VPC, you can assign up to five 
security groups to the instance. Security groups act at the instance level, 
not the subnet level. Therefore, each instance in a subnet in your VPC could 
be assigned to a different set of security groups. If you don't specify a 
particular group at launch time, the instance is automatically assigned to 
the default security group for the VPC.
*/
resource "aws_security_group" "ccp-sg" {
  name        = "${var.environment_type}-ccp-sg"
  description = "Allow TLS inbound traffic"

  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["${var.vpc-cider-block}"]
  }
  ingress {
    # TLS (change to whatever ports you need)
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    # Please restrict your ingress to only necessary IPs and ports.
    # Opening to 0.0.0.0/0 can lead to security vulnerabilities.
    cidr_blocks = ["${var.vpc-cider-block}"]
  }
  vpc_id = "${var.vpc_id}"
  tags = {
    Name = "${var.environment_type}"
    Contact = "${var.contact}"
  }
}