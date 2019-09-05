variable "instance_id" {}
variable "sns_topic_arn" {}
variable "environment_type" {
  default = "dev"
}
variable "contact" {
  default = "no-one@mill.com"
}
