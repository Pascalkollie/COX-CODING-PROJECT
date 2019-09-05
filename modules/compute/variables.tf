variable "ec2_count" {
  default = "1"
}
variable "ami_id" {}
variable "instance_type" {
  default = "t2.micro"
}
variable "subnet_id" {}
variable "sg_id" {}
variable "vpc_id" {}


variable "ec2_az" {
  default = "us-east-1"
}

variable "instance_id" {}

variable "environment_type" {
  default = "dev"
}
variable "contact" {
  default = "no-one@mill.com"
}
variable "alb_subnets" {}

variable "certificate_arn" {}


