output "sqs_name" {
  value = aws_sqs_queue.my_first_queue.name
}

output "sqs_arn" {
  value = aws_sqs_queue.my_first_queue.arn
}

output "queue_url" {
  value = aws_sqs_queue.my_first_queue.url
}

output "queue_arn" {
  value = aws_sqs_queue.my_first_queue.arn
}