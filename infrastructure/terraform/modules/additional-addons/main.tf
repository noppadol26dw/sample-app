# Data source to get latest add-on versions
data "aws_eks_addon_version" "metrics_server" {
  count              = var.enable_metrics_server ? 1 : 0
  addon_name         = "metrics-server"
  kubernetes_version = var.cluster_version
  most_recent        = true
}

data "aws_eks_addon_version" "kube_state_metrics" {
  count              = var.enable_kube_state_metrics ? 1 : 0
  addon_name         = "kube-state-metrics"
  kubernetes_version = var.cluster_version
  most_recent        = true
}

data "aws_eks_addon_version" "node_exporter" {
  count              = var.enable_node_exporter ? 1 : 0
  addon_name         = "prometheus-node-exporter"
  kubernetes_version = var.cluster_version
  most_recent        = true
}

# Metrics Server (Community Add-on)
resource "aws_eks_addon" "metrics_server" {
  count = var.enable_metrics_server ? 1 : 0

  cluster_name  = var.cluster_name
  addon_name    = "metrics-server"
  addon_version = data.aws_eks_addon_version.metrics_server[0].version

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "PRESERVE"

  tags = merge(
    var.tags,
    {
      Name = "${var.cluster_name}-metrics-server"
    }
  )

  depends_on = [var.cluster_ready]
}

# Kube State Metrics (Community Add-on)
resource "aws_eks_addon" "kube_state_metrics" {
  count = var.enable_kube_state_metrics ? 1 : 0

  cluster_name  = var.cluster_name
  addon_name    = "kube-state-metrics"
  addon_version = data.aws_eks_addon_version.kube_state_metrics[0].version

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "PRESERVE"

  tags = merge(
    var.tags,
    {
      Name = "${var.cluster_name}-kube-state-metrics"
    }
  )

  depends_on = [var.cluster_ready]
}

# Prometheus Node Exporter (Community Add-on)
resource "aws_eks_addon" "node_exporter" {
  count = var.enable_node_exporter ? 1 : 0

  cluster_name  = var.cluster_name
  addon_name    = "prometheus-node-exporter"
  addon_version = data.aws_eks_addon_version.node_exporter[0].version

  resolve_conflicts_on_create = "OVERWRITE"
  resolve_conflicts_on_update = "PRESERVE"

  tags = merge(
    var.tags,
    {
      Name = "${var.cluster_name}-prometheus-node-exporter"
    }
  )

  depends_on = [var.cluster_ready]
}