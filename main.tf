terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.4.0"
    }
  }
}
provider "aws" {
  region = var.aws_region
}

module "VPCs" {
  source = "./Modules/VPC"
  vpc_variables      = var.vpc_variables
  subnets            = var.subnets
  ingress_ports_list = var.ingress_ports_list
  sg_ingress_cidr    = var.sg_ingress_cidr
  tags = var.tags
}


module "ECS" {
  source = "./Modules/ECS"
  ECS_Name           = var.ECS_Name
  private_subnet_ids = values(module.VPCs.private_subnet_ids)
  vpc_id             = module.VPCs.vpc_id
  security_group_ids = [module.VPCs.public_security_group_id]
  tags               = var.tags
  container_image    = "${module.ECR.repository_url}:latest"
  container_cpu      = var.container_cpu
  container_memory   = var.container_memory
  desired_count      = var.desired_count
  log_retention_days = var.log_retention_days
  aws_region         = var.aws_region
}

module "ECR" {
  source = "./Modules/ECR"
  ECR_Name = var.ECR_Name
  tags     = var.tags
}

module "Amrize_Testing_LB" {
  source = "./Modules/APP_Load_Balancer"
  
  tags                = var.tags
  vpc_id              = module.VPCs.vpc_id
  public_subnet_ids   = values(module.VPCs.public_subnet_ids)
  security_group_ids  = [module.VPCs.public_security_group_id]
  target_group_arn    = module.ECS.target_group_arn
}