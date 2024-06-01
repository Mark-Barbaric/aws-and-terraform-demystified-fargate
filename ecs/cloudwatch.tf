resource "aws_kms_key" "ecs_kms_key" {
    description                 = "ECS KMS Encryption Key"
    deletion_window_in_days     = 7
}

resource "aws_cloudwatch_log_group" "main" {
    name                        = "${var.name}_logs"
}