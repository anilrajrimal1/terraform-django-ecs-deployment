data "aws_iam_role" "existing_ecsTaskExecutionRole" {
  name = "ecsTaskExecutionRole"
}

data "aws_iam_policy_document" "assume_role_policy" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecsTaskExecutionRole" {
  count              = length(data.aws_iam_role.existing_ecsTaskExecutionRole.arn) == 0 ? 1 : 0
  name               = "ecsTaskExecutionRole"
  assume_role_policy = data.aws_iam_policy_document.assume_role_policy.json
}

resource "aws_iam_role_policy_attachment" "ecsTaskExecutionRole_policy" {
  count      = length(data.aws_iam_role.existing_ecsTaskExecutionRole.arn) == 0 ? 1 : 0
  role       = aws_iam_role.ecsTaskExecutionRole[0].name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

locals {
  ecs_task_role_arn = length(data.aws_iam_role.existing_ecsTaskExecutionRole.arn) == 0 ? aws_iam_role.ecsTaskExecutionRole[0].arn : data.aws_iam_role.existing_ecsTaskExecutionRole.arn
}
