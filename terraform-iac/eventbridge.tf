resource "aws_cloudwatch_event_rule" "my_first_event_rule" {
  name        = "my_first_event_rule"
  schedule_expression = "rate(1 minute)"
}

resource "aws_cloudwatch_event_target" "sqs" {
  rule      = aws_cloudwatch_event_rule.my_first_event_rule.name
  target_id = "SendToSQS"
  arn       = aws_sqs_queue.my_first_queue.arn
}

# resource "aws_cloudwatch_event_rule" "my_first_event_rule_for_lambda" {
#   name        = "my_first_event_rule"
#   schedule_expression = "rate(1 minute)"
# }

# resource "aws_cloudwatch_event_target" "lambda" {
#   rule = aws_cloudwatch_event_rule.my_first_event_rule_for_lambda.name
#   target_id = "SendToLambda"
#   arn = aws_lambda_function.my_serverless_lambda.arn
# }