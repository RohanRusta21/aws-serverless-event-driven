variable "db_name" {
  default = "LambdaTriggeredEvents"
  description = "dynamodb database name"
}

variable "partition-key" {
  default = "id"
  description = "our partition key or hash key for db"
}

variable "lambda_function_name" {
  description = "lambda function name"
}