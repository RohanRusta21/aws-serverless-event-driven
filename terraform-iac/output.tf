# output "cloudwatch_name" {
#   value = module.cloudwatch.cloudwatch_log_group_name
# }

output "dynamodb_name" {
  value = module.dynamodb.db_name
}

# output "eventbridge_rule_name" {
#   value = module.eventbridge.my_serverless_event_rule
# }

output "lambda_name" {
  value = module.lambda.lambda_function_name
}

# output "sqs_name" {
#   value = module.sqs.queue_name
# }