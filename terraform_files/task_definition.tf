locals {
  db_host = aws_db_instance.my_db.address
}

resource "aws_ecs_task_definition" "django_task" {
  family                   = "django-task"
  container_definitions    = <<DEFINITION
  [
    {
      "name": "django-task",
      "image": "docker.io/anilrajrimal/django-crud:latest",
      "essential": true,
      "portMappings": [
        {
          "containerPort": 8000,
          "hostPort": 8000
        }
      ],
      "memory": 512,
      "cpu": 512,
      "environment": [
        {
          "name": "DB_HOST",
          "value": "${local.db_host}"
        },
        {
          "name": "DB_USERNAME",
          "value": "${var.db_username}"
        },
        {
          "name": "DB_PASSWORD",
          "value": "${var.db_password}"
        },
        {
          "name": "DB_NAME",
          "value": "${var.db_name}"
        },
        {
          "name": "DB_PORT",
          "value": "5432"
        }

      ],
      "healthCheck": {
        "command": ["CMD-SHELL", "exit 0"],
        "interval": 30,
        "timeout": 5,
        "retries": 3,
        "startPeriod": 120
      },
      "command": ["python3", "manage.py", "migrate"],
      "logConfiguration": {
          "logDriver": "awslogs",
          "options": {
            "awslogs-group": "${var.cloudwatch_group}",
            "awslogs-region": "${var.region}",
            "awslogs-stream-prefix": "ecs"
          }
        }
    }
  ]
  DEFINITION
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  memory                   = 1024
  cpu                      = 512
  execution_role_arn       = local.ecs_task_role_arn
}
