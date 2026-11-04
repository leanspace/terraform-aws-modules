<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | n/a |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_opensearch"></a> [opensearch](#module\_opensearch) | terraform-aws-modules/opensearch/aws | 1.7.0 |

## Resources

| Name | Type |
|------|------|
| [aws_security_group.opensearch](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group) | resource |
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_partition.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/partition) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Name of the Opensearch cluster | `string` | n/a | yes |
| <a name="input_data_node_count"></a> [data\_node\_count](#input\_data\_node\_count) | Number of data nodes | `number` | n/a | yes |
| <a name="input_data_node_type"></a> [data\_node\_type](#input\_data\_node\_type) | Instance type for data nodes | `string` | n/a | yes |
| <a name="input_high_availability"></a> [high\_availability](#input\_high\_availability) | Enable high availability for the OpenSearch cluster | `bool` | n/a | yes |
| <a name="input_master_node_type"></a> [master\_node\_type](#input\_master\_node\_type) | Instance type for master nodes | `string` | n/a | yes |
| <a name="input_opensearch_encryption_key_arn"></a> [opensearch\_encryption\_key\_arn](#input\_opensearch\_encryption\_key\_arn) | Arn of kms key for encrypting OpenSearch data at rest | `string` | n/a | yes |
| <a name="input_opensearch_tls_security_policy"></a> [opensearch\_tls\_security\_policy](#input\_opensearch\_tls\_security\_policy) | TLS security policy for OpenSearch | `string` | `"Policy-Min-TLS-1-2-2019-07"` | no |
| <a name="input_opensearch_version"></a> [opensearch\_version](#input\_opensearch\_version) | Version of OpenSearch to deploy | `string` | `"OpenSearch_2.11"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | List of private subnet IDs for the EKS cluster | `list(string)` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | Common tags to apply to all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID where the EKS cluster will be deployed | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the OpenSearch cluster |
| <a name="output_endpoint"></a> [endpoint](#output\_endpoint) | Endpoint of the OpenSearch cluster |
| <a name="output_name"></a> [name](#output\_name) | Name of the OpenSearch cluster |
<!-- END_TF_DOCS -->