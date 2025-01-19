variable "lambda_function_name" {
  description = "my lambda function name"
}

variable "lambda_role_name" {
  description = "IAM role name for the Lambda function"
  type        = string
}

variable "lambda_policy_arn" {
  description = "IAM policy ARN for the Lambda function"
  type        = string
}