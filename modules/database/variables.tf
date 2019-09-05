variable "allocated_storage" {
  default = 20
}
variable "storage_type" {
  default = "gp2"
}
variable "engine" {
  default = "mysql"
}
variable "engine_version" {
  default = "5.7"
}
variable "instance_class" {
  default = "db.t2.micro"
}
variable "db_name" {
  default = "ccpDB"
}
variable "password" {
  default = "test"
}
variable "username" {
  default = "root"
}
variable "parameter_group_name" {
  default = "default.mysql5.7"
}
variable "vpc_security_group_ids" {}
variable "db_subnet_group_name" {}

variable "subnet_ids" {}
variable "port" {
  default = 3306
}
variable "environment_type" {
  default = "dev"
}
variable "contact" {
  default = "no-one@mill.com"
}

