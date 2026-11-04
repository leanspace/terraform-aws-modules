
resource "aws_cloudwatch_log_group" "eks_control_plane_logs" {
  for_each          = toset(var.eks_log_types)
  name              = "/aws/eks/${var.cluster_name}/${each.key}"
  retention_in_days = var.retention_in_days
  tags              = var.tags
}