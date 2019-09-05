/*
AUTHOR:
Pascal Kollie
PURPOSE:
An Internet gateway is a network "node" that connects two different networks that use 
different protocols (rules) for communicating. ... If you have a Wi-Fi connection at home, 
your Internet gateway is the modem or modem/router combination that your ISP provides so 
that you connect to the Internet through their network.
*/
resource "aws_internet_gateway" "ccp-igw" {
  vpc_id = "${var.vpc_id}"
  tags = {
    Name = "${var.environment_type}"
    Contact = "${var.contact}"
  }
}