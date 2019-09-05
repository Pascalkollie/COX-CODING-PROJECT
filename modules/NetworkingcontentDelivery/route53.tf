/*
AUTHOR:
Pascal Kollie
PURPOSE:
Amazon Route 53 is a highly available and scalable cloud Domain Name System (DNS) 
web service. It is designed to give developers and businesses an extremely reliable 
and cost effective way to route end users to Internet applications by translating 
names like www.example.com into the numeric IP addresses like 192.0.2.1 that computers 
use to connect to each other. Amazon Route 53 is fully compliant with IPv6 as well.
INFO: 
""
*/
data "aws_route53_zone" "domain_name" {
  name         = "${var.domain_name}"
  private_zone = false
}

// This Route53 record will point at CloudFront distribution.
resource "aws_route53_record" "ccp-r53" {
  zone_id = "${data.aws_route53_zone.domain_name.zone_id}"
  name    = "${data.aws_route53_zone.domain_name.name}"
  type    = "A"
  alias {
    name                   = "${var.alb_dns_name}"
    zone_id                = "${var.alb_hosted_zone_id}"
    evaluate_target_health = false
  }
}