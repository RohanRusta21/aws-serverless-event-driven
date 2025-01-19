resource "aws_cloudwatch_event_rule" "my_first_event_rule" {
  name        = var.my_serverless_event_rule
  schedule_expression = "rate(1 minute)"
}

resource "aws_cloudwatch_event_target" "sqs" {
  rule      = aws_cloudwatch_event_rule.my_first_event_rule.name
  target_id = "SendToSQS"
  arn       = var.sqs_arn
}

resource "aws_sqs_queue_policy" "event_to_sqs" {
  queue_url = var.sqs_queue_url

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "events.amazonaws.com"
        }
        Action   = "sqs:SendMessage"
        Resource = var.sqs_queue_arn
        Condition = {
          ArnEquals = {
            "aws:SourceArn": aws_cloudwatch_event_rule.my_first_event_rule.arn
          }
        }
      }
    ]
  })
}