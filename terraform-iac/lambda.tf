data "aws_iam_policy_document" "lambda_assume_role" {
  statement {
    effect = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "iam_for_lambda" {
  name               = "iam_for_lambda"
  assume_role_policy = data.aws_iam_policy_document.lambda_assume_role.json
}

data "aws_iam_policy_document" "lambda_dynamodb_sqs" {
  statement {
    effect = "Allow"
    actions = [
      "dynamodb:*",
      "sqs:*"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "lambda_dynamodb_sqs_policy" {
  name        = "lambda_dynamodb_sqs_policy"
  description = "Policy for Lambda to access DynamoDB and SQS"
  policy      = data.aws_iam_policy_document.lambda_dynamodb_sqs.json
}

resource "aws_iam_role_policy_attachment" "lambda_dynamodb_sqs_attachment" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = aws_iam_policy.lambda_dynamodb_sqs_policy.arn
}

data "archive_file" "lambda" {
  type        = "zip"
  source_file = "my_lambda_code/index.mjs"
  output_path = "my_lambda_code.zip"
}

resource "aws_lambda_function" "my_serverless_lambda" {
  filename      = "my_lambda_code.zip"
  function_name = var.lambda_function_name
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "index.handler"
  runtime       = "nodejs20.x"
  source_code_hash = data.archive_file.lambda.output_base64sha256

  environment {
    variables = {
        TABLE_NAME = aws_dynamodb_table.serverless_dynamodb_table.name
    }
  }

  depends_on = [ aws_dynamodb_table.serverless_dynamodb_table ]
}

resource "aws_lambda_permission" "allow_eventbridge_to_invoke_lambda" {
  statement_id  = "AllowExecutionFromEventBridge"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.my_serverless_lambda.function_name
  principal     = "events.amazonaws.com"
  source_arn    = aws_cloudwatch_event_rule.my_first_event_rule_for_lambda.arn
}
