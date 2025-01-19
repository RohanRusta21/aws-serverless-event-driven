resource "aws_sqs_queue" "my_first_queue" {
  name                      = var.queue_name
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10
}

resource "aws_lambda_event_source_mapping" "mapping_sqs_lambda" {
  event_source_arn = aws_sqs_queue.my_first_queue.arn
  function_name    = var.lambda_function_arn
  enabled = true
  batch_size = 1
}