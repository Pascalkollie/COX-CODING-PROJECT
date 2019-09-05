variable "vpc-cider-block" {
  default = "10.0.0.0/16"
}
variable "vpc_instance_tenancy" {
  default = "dedicated"
}
variable "vpc_id" {}
variable "environment_type" {
  default = "dev"
}
variable "contact" {
  default = "no-one@mill.com"
}

variable "subnet_az-1" {
  default = "us-east-1e"
}
variable "subnet_az-2" {
  default = "us-east-1e"
}
variable "public_ip_on_launch" {
  default = false
}
variable "subnet-cider-block-1" {
  default = "10.0.1.0/24"
}
variable "subnet-cider-block-2" {
  default = "10.0.1.0/24"
}


