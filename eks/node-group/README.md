<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks_managed_node_group"></a> [eks\_managed\_node\_group](#module\_eks\_managed\_node\_group) | terraform-aws-modules/eks/aws//modules/eks-managed-node-group | 20.36.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the EKS cluster | `string` | n/a | yes |
| <a name="input_cluster_primary_security_group_id"></a> [cluster\_primary\_security\_group\_id](#input\_cluster\_primary\_security\_group\_id) | Security group ID for the EKS cluster | `string` | n/a | yes |
| <a name="input_cluster_service_cidr"></a> [cluster\_service\_cidr](#input\_cluster\_service\_cidr) | CIDR block for the EKS cluster service | `string` | `""` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | EKS cluster version | `string` | `"1.32"` | no |
| <a name="input_desired_node_count"></a> [desired\_node\_count](#input\_desired\_node\_count) | Desired number of nodes in the EKS node group | `number` | n/a | yes |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment for the EKS node group (e.g., dev, prod) | `string` | n/a | yes |
| <a name="input_maximum_node_count"></a> [maximum\_node\_count](#input\_maximum\_node\_count) | Maximum number of nodes in the EKS node group | `number` | n/a | yes |
| <a name="input_minimum_node_count"></a> [minimum\_node\_count](#input\_minimum\_node\_count) | Minimum number of nodes in the EKS node group | `number` | n/a | yes |
| <a name="input_node_capacity_type"></a> [node\_capacity\_type](#input\_node\_capacity\_type) | Capacity type for the EKS node group (e.g., ON\_DEMAND, SPOT) | `string` | n/a | yes |
| <a name="input_node_group_name"></a> [node\_group\_name](#input\_node\_group\_name) | Name of the EKS node group | `string` | n/a | yes |
| <a name="input_node_instance_types"></a> [node\_instance\_types](#input\_node\_instance\_types) | List of instance types for the EKS node group | `list(string)` | n/a | yes |
| <a name="input_iam_role_additional_policies"></a> [iam\_role\_additional\_policies](#input\_iam\_role\_additional\_policies) | Extra IAM policies for the node role (key => ARN). Keep minimal: pods can reach it through IMDS | `map(string)` | SSM, WORKNODEPOLICY, EKSCNI, ECR | no |
| <a name="input_metadata_http_put_response_hop_limit"></a> [metadata\_http\_put\_response\_hop\_limit](#input\_metadata\_http\_put\_response\_hop\_limit) | IMDSv2 hop limit; 1 blocks pods from reaching IMDS. Changing it rolls the node group | `number` | `1` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of private subnet IDs for the EKS cluster | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Common tags to apply to all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_security_group_ids"></a> [vpc\_security\_group\_ids](#input\_vpc\_security\_group\_ids) | Security group ID for the EKS node group | `list(string)` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_node_group_autoscaling_group_names"></a> [node\_group\_autoscaling\_group\_names](#output\_node\_group\_autoscaling\_group\_names) | n/a |
<!-- END_TF_DOCS -->