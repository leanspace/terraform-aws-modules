resource "aws_vpclattice_service_network" "this" {
  name      = var.name
  auth_type = var.auth_type
  tags      = var.tags
}

resource "aws_vpclattice_service_network_vpc_association" "this" {
  service_network_identifier = aws_vpclattice_service_network.this.id
  vpc_identifier             = var.vpc_id
  security_group_ids         = var.security_group_ids
  tags                       = var.tags
}

resource "aws_cloudwatch_log_group" "this" {
  name              = "/aws/vpclattice/${var.name}-service-network-logs"
  retention_in_days = 7
}

resource "aws_vpclattice_access_log_subscription" "this" {
  resource_identifier = aws_vpclattice_service_network.this.id
  destination_arn     = aws_cloudwatch_log_group.this.arn
}
