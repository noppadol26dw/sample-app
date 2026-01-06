# VPC Outputs
output "vpc" {
  description = "VPC and network information"
  value = {
    vpc_id             = module.vpc.vpc_id
    private_subnet_ids = module.vpc.private_subnet_ids
    public_subnet_ids  = module.vpc.public_subnet_ids
  }
}

# EKS Cluster Outputs
output "eks_cluster" {
  description = "EKS cluster details"
  value = {
    id       = module.eks.cluster_id
    name     = module.eks.cluster_name
    endpoint = module.eks.cluster_endpoint
    version  = module.eks.cluster_version
    arn      = module.eks.cluster_arn
  }
}

output "eks_cluster_certificate_authority_data" {
  description = "EKS cluster certificate authority data"
  value       = module.eks.cluster_certificate_authority_data
  sensitive   = true
}

# Application IAM Outputs
output "app_iam" {
  description = "Application IAM role and Pod Identity info"
  value = {
    role_arn                    = module.iam_app.iam_role_arn
    role_name                   = module.iam_app.iam_role_name
    pod_identity_association_id = module.iam_app.pod_identity_association_id
  }
}

# Additional Add-ons Outputs
output "addons" {
  description = "Additional add-ons status"
  value = {
    metrics_server     = module.additional_addons.metrics_server_id
    kube_state_metrics = module.additional_addons.kube_state_metrics_id
  }
}

# Commands
output "commands" {
  description = "Useful kubectl and setup commands"
  value = {
    update_kubeconfig      = "aws eks update-kubeconfig --region ${var.aws_region} --name ${module.eks.cluster_name}"
    create_namespace       = "kubectl create namespace ${var.app_namespace}"
    create_service_account = "kubectl create serviceaccount ${var.app_service_account} -n ${var.app_namespace}"
    verify_metrics         = "kubectl top nodes && kubectl top pods -A"
  }
}
