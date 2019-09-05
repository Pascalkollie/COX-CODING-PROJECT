/*
AUTHOR:
Pascal Kollie
PURPOSE:
Amazon Simple Notification Service (Amazon SNS) is a web service that coordinates and manages the delivery or sending of messages to subscribing endpoints or clients.
for more inforatmion "https://www.terraform.io/docs/providers/aws/r/sns_topic.html"
*/

resource "aws_sns_topic" "ccp-aws-sns-topic" {
  name = "${var.environment_type}-ccp-topic"
  delivery_policy = <<EOF
{
  "http": {
    "defaultHealthyRetryPolicy": {
      "minDelayTarget": 20,
      "maxDelayTarget": 20,
      "numRetries": 3,
      "numMaxDelayRetries": 0,
      "numNoDelayRetries": 0,
      "numMinDelayRetries": 0,
      "backoffFunction": "linear"
    },
    "disableSubscriptionOverrides": false,
    "defaultThrottlePolicy": {
      "maxReceivesPerSecond": 1
    }
  }
}
EOF
}
#Provides a resource for subscribing to SNS topics. Requires that an SNS topic 
#exist for the subscription to attach to. This resource allows you to automatically 
#place messages sent to SNS topics in SQS queues, send them as HTTP(S) POST requests
# to a given endpoint, send SMS messages, or notify devices / applications. 
#The most likely use case for Terraform users will probably be SQS queues.
resource "aws_sns_topic_subscription" "ccp-aws-sns-topic-subscription" {
  topic_arn = "${var.topic_arn}"
  protocol  = "${var.subscribing_protocal}"
  endpoint  = "${var.subscribing_endpoint}"
}