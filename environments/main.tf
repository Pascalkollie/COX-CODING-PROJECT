
provider "aws" {
  region = "us-east-1"
}
module "dev_vpc" {
  source      = "../modules/networking"
  vpc-cider-block  = "192.168.0.0/16"
  vpc_instance_tenancy  = "default"
  vpc_id = "${module.dev_vpc.vpc_id}"
  environment_type = "dev"
  contact = "Pascal.Kollie@gmail.com"
  subnet_az-1 = "us-east-1d"
  subnet_az-2 = "us-east-1f"
  public_ip_on_launch = false
  subnet-cider-block-1 = "192.168.1.0/24"
  subnet-cider-block-2 = "192.168.2.0/24"
}
# Need to buy a domain for this to work 
# module "dev_certificate" {
#   source        = "../modules/securityIdentityCompliance"
#   domain_name = "www.ccp.com"
# }
module "dev_certificate" {
  source        = "../modules/securityIdentityCompliance"
  r5_domain_name = "www.qa.aiazing.com" #"www.ccp.com" #You need to buy a domain
  environment_type = "dev"
  contact = "Pascal.Kollie@gmail.com"
}
module "dev_ec2_instance" {
  
  source        = "../modules/compute"
  ec2_count     = 1 
  ami_id        = "ami-00eb20669e0990cb4" #Amazon Linux AMI 2018.03.0 (HVM), SSD Volume Type - ami-00eb20669e0990cb4
  instance_type = "t2.micro"
  subnet_id     = "${module.dev_vpc.subnet_id_1}"
  ec2_az = "us-east-1d"
  environment_type = "dev"
  contact = "Pascal.Kollie@gmail.com"
  sg_id = ["${module.dev_vpc.security_group_id}"]
  vpc_id = "${module.dev_vpc.vpc_id}"
  alb_subnets = ["${module.dev_vpc.subnet_id_1}", "${module.dev_vpc.subnet_id_2}"]
  certificate_arn = "${module.dev_certificate.acm_certificate_arn}"
  instance_id = "${module.dev_ec2_instance.instance_id}"
}
module "dev_sns" {
  source        = "../modules/applicationIntegration"
  topic_arn = "${module.dev_sns.sns_topic_arn}"
  subscribing_endpoint = "4043452673"
  subscribing_protocal = "sms"
}
module "dev_rds" {
  source        = "../modules/database"
  allocated_storage = 20
  storage_type = "gp2"
  engine = "mysql"
  engine_version = "5.7"
  instance_class = "db.t2.micro"
  db_name = "ccpDB"
  password = "test1234"
  username = "root"
  parameter_group_name = "default.mysql5.7"
  subnet_ids =  ["${module.dev_vpc.subnet_id_1}", "${module.dev_vpc.subnet_id_2}"]
  vpc_security_group_ids = ["${module.dev_vpc.security_group_id}"]
  port = 3306
  environment_type = "dev"
  contact = "Pascal.Kollie@gmail.com"
  db_subnet_group_name = "${module.dev_rds.db_subnet_group_name}"
}
module "dev_alarms" {
  source        = "../modules/managementGovernance"
  instance_id = "${module.dev_ec2_instance.instance_id}"
  sns_topic_arn = ["${module.dev_sns.sns_topic_arn}"]
  environment_type = "dev"
  contact = "Pascal.Kollie@gmail.com"
}