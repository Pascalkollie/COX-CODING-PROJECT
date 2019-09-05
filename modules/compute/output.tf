
#For example, to correlate with indices of a referring resource, use:
#aws_instance.ccp-aws-instance[count.index]
output "instance_id" {
  value = "${aws_instance.ccp-aws-instance.0.id}"
}

output "alb_zone_id" {
  value = "${aws_lb.ccp-alb.zone_id}"
}
output "alb_dns_name" {
  value = "${aws_lb.ccp-alb.dns_name}"
}
output "alb_id" {
  value = "${aws_lb.ccp-alb.id}"
}

