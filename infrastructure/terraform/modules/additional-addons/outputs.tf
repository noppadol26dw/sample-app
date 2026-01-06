output "metrics_server_id" {
  description = "Metrics Server addon ID"
  value       = var.enable_metrics_server ? aws_eks_addon.metrics_server[0].id : "disabled"
}

output "kube_state_metrics_id" {
  description = "Kube State Metrics addon ID"
  value       = var.enable_kube_state_metrics ? aws_eks_addon.kube_state_metrics[0].id : "disabled"
}

output "node_exporter_id" {
  description = "Node Exporter addon ID"
  value       = var.enable_node_exporter ? aws_eks_addon.node_exporter[0].id : "disabled"
}