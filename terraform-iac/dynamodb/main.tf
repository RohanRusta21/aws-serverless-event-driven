resource "aws_dynamodb_table" "serverless_dynamodb_table" {
  name           = var.db_name
  billing_mode   = "PROVISIONED"
  read_capacity  = 5
  write_capacity = 5
  hash_key       = var.partition-key

  attribute {
    name = var.partition-key
    type = "S"
  }

  depends_on = [ var.lambda_function_name ]
}