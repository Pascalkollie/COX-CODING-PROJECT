

/*
AUTHOR:
Pascal Kollie
PURPOSE:
Amazon RDS supports three types of instance classes: Standard, Memory Optimized, 
and Burstable Performance. For more information please read the AWS RDS documentation 
about DB Instance Class Types
*/

resource "aws_db_subnet_group" "ccp-db-subnet-group" {
  name       = "${var.environment_type}-ccp-db-subnet-group"
  subnet_ids = "${var.subnet_ids}"
  tags = {
    Name = "${var.environment_type}"
    Contact = "${var.contact}"
  }
}
resource "aws_db_instance" "ccp-rds-database" {
  allocated_storage    = "${var.allocated_storage}"
  storage_type         = "${var.storage_type}"
  engine               = "${var.engine}"
  engine_version       = "${var.engine_version}"
  instance_class       = "${var.instance_class}"
  name                 = "${var.db_name}"
  username             = "${var.username}"
  password             = "${var.password}"
  parameter_group_name = "${var.parameter_group_name}"
  db_subnet_group_name = "${var.db_subnet_group_name}"
  vpc_security_group_ids = "${var.vpc_security_group_ids}"
  port = "${var.port}"
  tags = {
    Name = "${var.environment_type}"
    Contact = "${var.contact}"
  }
}