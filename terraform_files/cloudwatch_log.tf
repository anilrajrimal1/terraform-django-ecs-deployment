resource "aws_cloudwatch_log_group" "ecs_log_group" {
  name              = var.cloudwatch_group
  retention_in_days = 1
}