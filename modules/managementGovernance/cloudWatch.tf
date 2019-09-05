/*
AUTHOR:
Pascal Kollie
PURPOSE:
Ccreate a CloudWatch alarm that watches a single CloudWatch metric or the result 
of a math expression based on CloudWatch metrics. The alarm performs one or more 
actions based on the value of the metric or expression relative to a threshold 
over a number of time periods. The action can be an Amazon EC2 action, an 
Amazon EC2 Auto Scaling action, or a notification sent to an Amazon SNS topic.
*/
resource "aws_cloudwatch_metric_alarm" "ccp-ec2-cpu-high" {

  alarm_name          = "${var.environment_type}-instance-id-${var.instance_id}-cup-usage-is-high"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"

  dimensions = {
    InstanceId = "${var.instance_id}"
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = "${var.sns_topic_arn}"
}

resource "aws_cloudwatch_metric_alarm" "status_check" {
  count               = 3
  alarm_name          = "${var.environment_type}-instance-id-${var.instance_id}-status-check-failed"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "StatusCheckFailed"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "1"
  alarm_description   = "This metric monitors ec2 status check."

  dimensions = {
    InstanceId = "${var.instance_id}"
  }
}
resource "aws_cloudwatch_metric_alarm" "ccp-ec2-cpu-low" {

  alarm_name          = "${var.environment_type}-instance-id-${var.instance_id}-cup-usage--is-low"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = "1"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "20"

  dimensions = {
    InstanceId = "${var.instance_id}"
  }

  alarm_description = "This metric monitors ec2 cpu utilization"
  alarm_actions     = "${var.sns_topic_arn}"
  tags = {
    Name = "${var.environment_type}"
    Contact = "${var.contact}"
  }
}