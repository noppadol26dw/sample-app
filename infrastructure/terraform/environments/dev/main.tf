locals {
  name_prefix = "${var.project_name}-${var.environment}"

  common_tags = {
    Environment = var.environment
    Project     = var.project_name
    ManagedBy   = "Terraform"
  }
}

# VPC Module
module "vpc" {
  source = "../../modules/vpc"

  name_prefix          = local.name_prefix
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  cluster_name         = var.cluster_name
  enable_nat_gateway   = var.enable_nat_gateway
  enable_flow_logs     = var.enable_flow_logs

  tags = local.common_tags
}

# EKS Module
module "eks" {
  source = "../../modules/eks"

  cluster_name                    = var.cluster_name
  cluster_version                 = var.cluster_version
  vpc_id                          = module.vpc.vpc_id
  vpc_cidr                        = var.vpc_cidr
  private_subnet_ids              = module.vpc.private_subnet_ids
  public_subnet_ids               = module.vpc.public_subnet_ids
  cluster_endpoint_private_access = var.cluster_endpoint_private_access
  cluster_endpoint_public_access  = var.cluster_endpoint_public_access
  cluster_log_retention_days      = var.cluster_log_retention_days
  enable_eks_automode             = var.enable_eks_automode

  # Managed Node Group Configuration (if automode = false)
  node_group_instance_types = var.node_group_instance_types
  node_group_desired_size   = var.node_group_desired_size
  node_group_min_size       = var.node_group_min_size
  node_group_max_size       = var.node_group_max_size

  tags = local.common_tags

  depends_on = [module.vpc]
}

# EKS Addons Module https://docs.aws.amazon.com/eks/latest/userguide/workloads-add-ons-available-eks.html
module "eks_addons" {
  source = "../../modules/eks-addons"

  cluster_name    = module.eks.cluster_name
  cluster_version = module.eks.cluster_version

  tags = local.common_tags

  depends_on = [module.eks]
}


# Additional Add-ons Module (Community Add-ons) https://docs.aws.amazon.com/eks/latest/userguide/community-addons.html
module "additional_addons" {
  source = "../../modules/additional-addons"

  cluster_name              = module.eks.cluster_name
  cluster_version           = module.eks.cluster_version
  cluster_ready             = module.eks.cluster_id
  enable_metrics_server     = var.enable_metrics_server
  enable_kube_state_metrics = var.enable_kube_state_metrics
  enable_node_exporter      = var.enable_node_exporter

  tags = local.common_tags

  depends_on = [module.eks_addons]
}

# IAM Application Module
module "iam_app" {
  source = "../../modules/iam-app"

  name_prefix         = local.name_prefix
  app_name            = var.app_name
  cluster_name        = module.eks.cluster_name
  app_namespace       = var.app_namespace
  app_service_account = var.app_service_account
  s3_bucket_arn       = var.s3_bucket_arn
  sqs_queue_arn       = var.sqs_queue_arn

  tags = local.common_tags

  depends_on = [module.eks_addons]
}
