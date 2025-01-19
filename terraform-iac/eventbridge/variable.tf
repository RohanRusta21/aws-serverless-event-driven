variable "my_serverless_event_rule" {
    default = "my_serverless_event_rule"
    description = "my event rule name for eventbridge to invoke sqs"
}

variable "sqs_arn" {
    description = "sqs arn to be used in eventbridge"
}

variable "sqs_queue_url" {
    description = "sqs queue url to be used in eventbridge"
}

variable "sqs_queue_arn" {
    description = "sqs queue arn to be used in eventbridge"
}