output "pod_identity_agent_addon_version" {
  description = "Version of eks-pod-identity-agent addon"
  value       = aws_eks_addon.pod_identity_agent.addon_version
}

output "vpc_cni_addon_version" {
  description = "Version of vpc-cni addon"
  value       = aws_eks_addon.vpc_cni.addon_version
}

output "coredns_addon_version" {
  description = "Version of coredns addon"
  value       = aws_eks_addon.coredns.addon_version
}

output "kube_proxy_addon_version" {
  description = "Version of kube-proxy addon"
  value       = aws_eks_addon.kube_proxy.addon_version
}

output "ebs_csi_driver_addon_version" {
  description = "Version of aws-ebs-csi-driver addon"
  value       = aws_eks_addon.ebs_csi_driver.addon_version
}

output "vpc_cni_role_arn" {
  description = "IAM role ARN for VPC CNI"
  value       = aws_iam_role.vpc_cni.arn
}

output "ebs_csi_role_arn" {
  description = "IAM role ARN for EBS CSI Driver"
  value       = aws_iam_role.ebs_csi.arn
}