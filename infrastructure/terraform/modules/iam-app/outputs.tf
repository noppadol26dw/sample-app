output "iam_role_arn" {
  description = "IAM role ARN for the application"
  value       = aws_iam_role.app.arn
}

output "iam_role_name" {
  description = "IAM role name for the application"
  value       = aws_iam_role.app.name
}

output "iam_policy_arn" {
  description = "IAM policy ARN for the application"
  value       = aws_iam_policy.app.arn
}

output "pod_identity_association_id" {
  description = "EKS Pod Identity Association ID"
  value       = aws_eks_pod_identity_association.app.id
}