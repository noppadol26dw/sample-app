# Environment Configuration
environment  = "dev"
project_name = "sample-app"
aws_region   = "ap-southeast-1"

# VPC Configuration
vpc_cidr             = "10.0.0.0/16"
availability_zones   = ["ap-southeast-1a", "ap-southeast-1b"]
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
enable_nat_gateway   = true
enable_flow_logs     = false

# EKS Configuration
cluster_name                    = "sample-app-dev-eks"
cluster_version                 = "1.32"
cluster_endpoint_public_access  = true
cluster_endpoint_private_access = true
cluster_log_retention_days      = 1

# EKS Compute Configuration
enable_eks_automode = false #เอาไว้ก่อน ยังไม่เวิร์ค

# Managed Node Group Configuration (only used if enable_eks_automode = false)
node_group_instance_types = ["m6g.medium"]
node_group_desired_size   = 2
node_group_min_size       = 1
node_group_max_size       = 4
node_group_capacity_type  = "ON_DEMAND"
node_group_labels = {
  role = "general"
}

# Application Configuration
app_name            = "sample-app"
app_namespace       = "sample-ns"
app_service_account = "sample-app-sa"

# Application IAM Permissions
s3_bucket_arn = "arn:aws:s3:::my-web-assets-999"
sqs_queue_arn = "arn:aws:sqs:ap-southeast-1:123456789123:lms-import-data"

# Additional Add-ons Configuration
enable_metrics_server     = true
enable_kube_state_metrics = true
enable_node_exporter      = false