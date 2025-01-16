variable "region" {
  default = "us-east-2"
  description = "aws region used for services"
}

######## variables for dynamodb ############

variable "db_name" {
  default = "LambdaTriggeredEvents"
  description = "dynamodb database name"
}

variable "partition-key" {
  default = "id"
  description = "our partition key or hash key for db"
}

####### for lambda function #######

variable "lambda_function_name" {
    default = "my_serverless_lambda"
    description = "my lambda function name" 
}
