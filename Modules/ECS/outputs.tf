output "target_group_arn" {
  description = "ARN of the target group for the ECS service"
  value       = aws_lb_target_group.ecs_targets.arn
}

output "ecs_cluster_id" {
  description = "ID of the ECS cluster"
  value       = aws_ecs_cluster.ECS_Amrize.id
}

output "ecs_service_name" {
  description = "Name of the ECS service"
  value       = aws_ecs_service.apache.name
}

output "task_definition_arn" {
  description = "ARN of the ECS task definition"
  value       = aws_ecs_task_definition.apache.arn
}

output "service_arn" {
  description = "ARN of the ECS service"
  value       = aws_ecs_service.apache.id
}

output "cluster_arn" {
  description = "ARN of the ECS cluster"
  value       = aws_ecs_cluster.ECS_Amrize.arn
}
