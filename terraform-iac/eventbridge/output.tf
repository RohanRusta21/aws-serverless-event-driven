output "eventbridge_name" {
  value = aws_cloudwatch_event_rule.my_first_event_rule.name
}