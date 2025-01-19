variable "queue_name" {
  default = "my_serverless_queue"  
  description = "Name of the SQS queue"
}

variable "lambda_function_arn" {
  description = "ARN of the Lambda function"
}