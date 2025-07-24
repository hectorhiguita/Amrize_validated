resource "aws_ecs_service" "apache" {
  name            = "apache-service"
  cluster         = aws_ecs_cluster.ECS_Amrize.id
  task_definition = aws_ecs_task_definition.apache.arn
  desired_count   = var.desired_count
  launch_type     = "FARGATE"

  network_configuration {
    subnets          = var.private_subnet_ids
    security_groups  = var.security_group_ids
    assign_public_ip = false
  }

  load_balancer {
    target_group_arn = aws_lb_target_group.ecs_targets.arn
    container_name   = "apache"
    container_port   = 80
  }

  depends_on = [aws_lb_target_group.ecs_targets]
}

# Target Group for ALB
resource "aws_lb_target_group" "ecs_targets" {
  name        = "${var.ECS_Name}-targets"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = var.vpc_id
  target_type = "ip"

  health_check {
    enabled             = true
    healthy_threshold   = var.healthy_threshold
    interval            = var.health_check_interval
    matcher             = "200"
    path                = var.health_check_path
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = var.health_check_timeout
    unhealthy_threshold = var.unhealthy_threshold
  }

  tags = {
    Name = "${var.ECS_Name}-target-group"
  }
}