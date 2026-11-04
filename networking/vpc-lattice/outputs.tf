output "service_network_id" {
  description = "The ID of the VPC Lattice service network"
  value       = aws_vpclattice_service_network.this.id
}
