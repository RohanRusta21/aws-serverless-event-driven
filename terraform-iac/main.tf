provider "aws" {
  region = var.region
}

module "cloudwatch" {
  source = "./cloudwatch"
  lambda_function_name = module.lambda.lambda_function_name
  lambda_role_name = module.lambda.iam_role_name
  lambda_policy_arn = module.lambda.iam_policy_arn
}

module "dynamodb" {
  source = "./dynamodb"
  db_name = "LambdaTriggeredEvents1"
  partition-key = "id"
  lambda_function_name = module.lambda.lambda_function_name
}

module "eventbridge" {
  source = "./eventbridge"
  my_serverless_event_rule = "my_serverless_event_rule_1"
  sqs_arn = module.sqs.sqs_arn
  sqs_queue_url = module.sqs.queue_url
  sqs_queue_arn = module.sqs.queue_arn
}

module "lambda" {
  source = "./lambda"
  lambda_function_name = "my_serverless_lambda_1"
  db_name = module.dynamodb.db_name
}

module "sqs" {
  source = "./sqs"
  queue_name = "my_first_queue_1"
  lambda_function_arn = module.lambda.function_arn
}
