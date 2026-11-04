resource "aws_iam_role" "this" {
  name = var.role_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Federated = var.oidc_provider_arn
        }
        Action = "sts:AssumeRoleWithWebIdentity"
        Condition = {
          StringEquals = {
            "${replace(var.oidc_provider_url, "https://", "")}:aud" = "sts.amazonaws.com"
          }
          # StringLike (not StringEquals) so entries can be exact subjects or
          # wildcard patterns (e.g. "system:serviceaccount:services:*") - lets new
          # ServiceAccounts opt in to an existing role purely via annotation, with
          # no Terraform change needed as long as they match a trusted pattern.
          StringLike = {
            "${replace(var.oidc_provider_url, "https://", "")}:sub" = var.service_account_subjects
          }
        }
      }
    ]
  })

  tags = var.tags
}

resource "aws_iam_policy" "this" {
  name   = var.policy_name
  policy = var.policy_json
}

resource "aws_iam_role_policy_attachment" "this" {
  role       = aws_iam_role.this.name
  policy_arn = aws_iam_policy.this.arn
}
