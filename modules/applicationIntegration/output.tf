output "sns_topic_arn" {
  value = "${aws_sns_topic.ccp-aws-sns-topic.arn}"
}
output "sns_subscription_arn" {
  value = "${aws_sns_topic_subscription.ccp-aws-sns-topic-subscription.arn}"
}