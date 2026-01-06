variable "cluster_name" {
  description = "Name of the EKS cluster"
  type        = string
}

variable "cluster_version" {
  description = "Kubernetes version of the EKS cluster"
  type        = string
}

variable "cluster_ready" {
  description = "Signal that cluster is ready (use cluster ID for dependency)"
  type        = string
}

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
  default     = false
}

variable "tags" {
  description = "Tags to apply to resources"
  type        = map(string)
  default     = {}
}