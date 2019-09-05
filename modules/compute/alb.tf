/*
AUTHOR:
Pascal Kollie
PURPOSE:
*/

resource "aws_lb" "ccp-alb" {
  name               = "${var.environment_type}-ccp-alb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = "${var.sg_id}"
  subnets            = "${var.alb_subnets}"
  enable_deletion_protection = true

  tags = {
    Name = "${var.environment_type}"
    Contact = "${var.contact}"
  }
}

resource "aws_lb_target_group" "ccp-tg" {
  name        = "${var.environment_type}-ccp-tg"
  target_type = "instance"
  vpc_id = "${var.vpc_id}"
  port = 443
  protocol = "HTTPS"
  tags = {
    Name = "${var.environment_type}"
    Contact = "${var.contact}"
  }
}
resource "aws_lb_target_group_attachment" "ccp-tga" {
  target_group_arn = "${aws_lb_target_group.ccp-tg.arn}"
  target_id        = "${var.instance_id}"
  port             = 443
}
resource "aws_lb_listener" "ccp-alb-listener" {
  load_balancer_arn = "${aws_lb.ccp-alb.arn}"
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "${var.certificate_arn}"
  default_action {
    type             = "forward"
    target_group_arn = "${aws_lb_target_group.ccp-tg.arn}"
  }
}