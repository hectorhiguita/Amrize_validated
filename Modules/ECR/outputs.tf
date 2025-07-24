output "repository_url" {
  description = "URL of the ECR repository"
  value       = aws_ecr_repository.ECR_Amrize.repository_url
}

output "repository_arn" {
  description = "ARN of the ECR repository"
  value       = aws_ecr_repository.ECR_Amrize.arn
}

output "registry_id" {
  description = "Registry ID of the ECR repository"
  value       = aws_ecr_repository.ECR_Amrize.registry_id
}

output "repository_name" {
  description = "Name of the ECR repository"
  value       = aws_ecr_repository.ECR_Amrize.name
}

output "repository_registry_id" {
  description = "Registry ID where the repository resides"
  value       = aws_ecr_repository.ECR_Amrize.registry_id
}
