variable "name_prefix" {
  description = "Prefix for resource names"
  type        = string
}

variable "app_name" {
  description = "Application name"
  type        = string
}

variable "cluster_name" {
  description = "EKS cluster name"
  type        = string
}

variable "app_namespace" {
  description = "Kubernetes namespace for the application"
  type        = string
}

variable "app_service_account" {
  description = "Kubernetes service account for the application"
  type        = string
}

variable "s3_bucket_name" {
  description = "S3 bucket name for app access (leave empty to skip S3 permissions)"
  type        = string
  default     = ""
}

variable "sqs_queue_arn" {
  description = "SQS queue ARN for app access (leave empty to skip SQS permissions)"
  type        = string
  default     = ""
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}