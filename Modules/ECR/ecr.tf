resource "aws_ecr_repository" "ECR_Amrize" {
  name                 = var.ECR_Name
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {    
    "project" = var.tags.project
    "cost-center" = var.tags["cost-center"]
    "entity" = var.tags.entity
    "application-name" = var.tags["application-name"]
  }
}