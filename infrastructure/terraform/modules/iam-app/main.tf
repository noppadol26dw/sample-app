# IAM Policy for Application
resource "aws_iam_policy" "app" {
  name        = "${var.name_prefix}-app-policy"
  description = "IAM policy for ${var.app_name} application"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = concat(
      var.s3_bucket_arn != "" ? [
        {
          Sid    = "S3Access"
          Effect = "Allow"
          Action = [
            "s3:GetObject",
            "s3:PutObject"
          ]
          Resource = "${var.s3_bucket_arn}/*"
        }
      ] : [],
      var.sqs_queue_arn != "" ? [
        {
          Sid    = "SQSAccess"
          Effect = "Allow"
          Action = [
            "sqs:SendMessage",
            "sqs:ReceiveMessage",
            "sqs:DeleteMessage"
          ]
          Resource = var.sqs_queue_arn
        }
      ] : []
    )
  })

  tags = merge(
    var.tags,
    {
      Name = "${var.name_prefix}-app-policy"
    }
  )
}

# IAM Role for Application with Pod Identity
resource "aws_iam_role" "app" {
  name = "${var.name_prefix}-app-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "pods.eks.amazonaws.com"
        }
        Action = [
          "sts:AssumeRole",
          "sts:TagSession"
        ]
      }
    ]
  })

  tags = merge(
    var.tags,
    {
      Name = "${var.name_prefix}-app-role"
    }
  )
}

# Attach Policy to Role
resource "aws_iam_role_policy_attachment" "app" {
  policy_arn = aws_iam_policy.app.arn
  role       = aws_iam_role.app.name
}

# EKS Pod Identity Association for Application
resource "aws_eks_pod_identity_association" "app" {
  cluster_name    = var.cluster_name
  namespace       = var.app_namespace
  service_account = var.app_service_account
  role_arn        = aws_iam_role.app.arn

  tags = merge(
    var.tags,
    {
      Name = "${var.name_prefix}-pod-identity"
    }
  )
}