resource "aws_ecs_service" "app_service" {
  name            = "anil-django-service"
  cluster         = aws_ecs_cluster.ecs_cluster1.id
  task_definition = aws_ecs_task_definition.django_task.arn
  launch_type     = "FARGATE"
  desired_count   = 1

  load_balancer {
    target_group_arn = aws_lb_target_group.target_group.arn
    container_name   = aws_ecs_task_definition.django_task.family
    container_port   = 8000
  }

  network_configuration {
    subnets          = [aws_subnet.public-subnet-1.id, aws_subnet.public-subnet-2.id]
    assign_public_ip = true
    security_groups  = [aws_security_group.sg1.id]
  }
}
