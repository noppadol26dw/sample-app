variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "environment" {
  description = "Environment name"
  type        = string
  default     = "poc"
}

variable "project_name" {
  description = "Project name"
  type        = string
  default     = ""
}

# VPC Variables
variable "vpc_cidr" {
  description = "VPC CIDR block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "availability_zones" {
  description = "List of availability zones"
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "public_subnet_cidrs" {
  description = "Public subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  description = "Private subnet CIDR blocks"
  type        = list(string)
  default     = ["10.0.11.0/24", "10.0.12.0/24"]
}

variable "enable_nat_gateway" {
  description = "Enable NAT Gateway for private subnets"
  type        = bool
  default     = true
}

variable "enable_flow_logs" {
  description = "Enable VPC Flow Logs"
  type        = bool
  default     = true
}

# EKS Variables
variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
  default     = ""
}

variable "cluster_version" {
  description = "EKS cluster version"
  type        = string
  default     = "1.34"
}

variable "cluster_endpoint_public_access" {
  description = "Enable public access to cluster endpoint"
  type        = bool
  default     = true
}

variable "cluster_endpoint_private_access" {
  description = "Enable private access to cluster endpoint"
  type        = bool
  default     = true
}

variable "cluster_log_retention_days" {
  description = "Cluster log retention in days"
  type        = number
  default     = 1
}

variable "enable_eks_automode" {
  description = "Enable EKS Auto Mode"
  type        = bool
  default     = false
}

variable "node_group_instance_types" {
  description = "Instance types for managed node group"
  type        = list(string)
  default     = ["t4g.large"]
}

variable "node_group_desired_size" {
  description = "Desired number of nodes"
  type        = number
  default     = 1
}

variable "node_group_min_size" {
  description = "Minimum number of nodes"
  type        = number
  default     = 1
}

variable "node_group_max_size" {
  description = "Maximum number of nodes"
  type        = number
  default     = 3
}

variable "node_group_capacity_type" {
  description = "Capacity type for node group (ON_DEMAND or SPOT)"
  type        = string
  default     = "ON_DEMAND"
}

variable "node_group_labels" {
  description = "Labels to apply to nodes in the node group"
  type        = map(string)
  default     = {}
}

# Application Variables
variable "app_name" {
  description = "Application name"
  type        = string
  default     = ""
}

variable "app_namespace" {
  description = "Kubernetes namespace for the application"
  type        = string
  default     = ""
}

variable "app_service_account" {
  description = "Kubernetes service account for the application"
  type        = string
  default     = ""
}

variable "s3_bucket_arn" {
  description = "S3 bucket ARN for app access"
  type        = string
  default     = ""
}

variable "sqs_queue_arn" {
  description = "SQS queue ARN for app access"
  type        = string
  default     = ""
}

# Additional Add-ons Variables
variable "enable_metrics_server" {
  description = "Enable Metrics Server for resource metrics"
  type        = bool
  default     = true
}

variable "enable_kube_state_metrics" {
  description = "Enable Kube State Metrics for Prometheus"
  type        = bool
  default     = true
}

variable "enable_node_exporter" {
  description = "Enable Prometheus Node Exporter"
  type        = bool
  default     = true
}