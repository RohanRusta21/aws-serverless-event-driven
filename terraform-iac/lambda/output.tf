output "lambda_function_name" {
  value = var.lambda_function_name
}

output "iam_role_name" {
  value = aws_iam_role.iam_for_lambda.name
}

output "iam_policy_arn" {
  value = aws_iam_policy.lambda_dynamodb_sqs_policy.arn
}

output "function_arn" {
  value = aws_lambda_function.my_serverless_lambda.arn
}


