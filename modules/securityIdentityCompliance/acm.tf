/*
AUTHOR:
Pascal Kollie
PURPOSE:
AWS Certificate Manager (ACM) makes it easy to provision, 
manage, deploy, and renew SSL/TLS certificates on the AWS platform.
INFO: 
"https://www.terraform.io/docs/providers/aws/r/acm_certificate.html"

*/
resource "aws_acm_certificate" "ccp-certificate" {
  domain_name       =  "${var.r5_domain_name}"
  validation_method = "DNS"
  tags = {
    Name = "${var.environment_type}"
    Contact = "${var.contact}"
  }
  lifecycle {
    create_before_destroy = true
  }
}
