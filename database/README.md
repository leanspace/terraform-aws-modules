# PostgreSQL Example

Configuration in this directory creates a PostgreSQL Aurora cluster.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_aurora"></a> [aurora](#module\_aurora) | terraform-aws-modules/rds-aurora/aws | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_apply_immediately"></a> [apply\_immediately](#input\_apply\_immediately) | n/a | `bool` | `true` | no |
| <a name="input_aurora_allow_major_version_upgrade"></a> [aurora\_allow\_major\_version\_upgrade](#input\_aurora\_allow\_major\_version\_upgrade) | Allow major version upgrades | `bool` | `true` | no |
| <a name="input_aurora_engine_version"></a> [aurora\_engine\_version](#input\_aurora\_engine\_version) | Aurora PostgreSQL engine version | `string` | n/a | yes |
| <a name="input_aurora_instances"></a> [aurora\_instances](#input\_aurora\_instances) | Map of Aurora instances | `map(any)` | n/a | yes |
| <a name="input_aurora_master_username"></a> [aurora\_master\_username](#input\_aurora\_master\_username) | Master username | `string` | `"root"` | no |
| <a name="input_aurora_name"></a> [aurora\_name](#input\_aurora\_name) | Name of the Aurora cluster | `string` | n/a | yes |
| <a name="input_aurora_storage_type"></a> [aurora\_storage\_type](#input\_aurora\_storage\_type) | Aurora storage type | `string` | `"aurora-iopt1"` | no |
| <a name="input_cloudwatch_log_group_class"></a> [cloudwatch\_log\_group\_class](#input\_cloudwatch\_log\_group\_class) | n/a | `string` | `"STANDARD"` | no |
| <a name="input_cloudwatch_log_group_kms_key_id"></a> [cloudwatch\_log\_group\_kms\_key\_id](#input\_cloudwatch\_log\_group\_kms\_key\_id) | The ARN of the KMS Key to use when encrypting log data | `string` | `null` | no |
| <a name="input_copy_tags_to_snapshot"></a> [copy\_tags\_to\_snapshot](#input\_copy\_tags\_to\_snapshot) | n/a | `bool` | `true` | no |
| <a name="input_create_cloudwatch_log_group"></a> [create\_cloudwatch\_log\_group](#input\_create\_cloudwatch\_log\_group) | Determines whether a CloudWatch log group is created for each `enabled_cloudwatch_logs_exports` | `bool` | `true` | no |
| <a name="input_create_db_cluster_parameter_group"></a> [create\_db\_cluster\_parameter\_group](#input\_create\_db\_cluster\_parameter\_group) | Determines whether a cluster parameter should be created or use existing | `bool` | `true` | no |
| <a name="input_create_db_parameter_group"></a> [create\_db\_parameter\_group](#input\_create\_db\_parameter\_group) | Determines whether a DB parameter should be created or use existing | `bool` | `true` | no |
| <a name="input_create_db_subnet_group"></a> [create\_db\_subnet\_group](#input\_create\_db\_subnet\_group) | Determines whether to create the database subnet group or use existing | `bool` | `true` | no |
| <a name="input_db_cluster_parameter_group_description"></a> [db\_cluster\_parameter\_group\_description](#input\_db\_cluster\_parameter\_group\_description) | n/a | `string` | `"Aurora DB cluster Parameter Group"` | no |
| <a name="input_db_cluster_parameter_group_family"></a> [db\_cluster\_parameter\_group\_family](#input\_db\_cluster\_parameter\_group\_family) | n/a | `string` | `"aurora-postgresql14"` | no |
| <a name="input_db_cluster_parameter_group_name"></a> [db\_cluster\_parameter\_group\_name](#input\_db\_cluster\_parameter\_group\_name) | Name of the DB cluster paramater group | `string` | n/a | yes |
| <a name="input_db_cluster_parameter_group_parameters"></a> [db\_cluster\_parameter\_group\_parameters](#input\_db\_cluster\_parameter\_group\_parameters) | List of parameters for the DB cluster parameter group | <pre>list(object({<br/>    name         = string<br/>    value        = any<br/>    apply_method = string<br/>  }))</pre> | <pre>[<br/>  {<br/>    "apply_method": "immediate",<br/>    "name": "rds.force_ssl",<br/>    "value": 1<br/>  }<br/>]</pre> | no |
| <a name="input_db_parameter_group_description"></a> [db\_parameter\_group\_description](#input\_db\_parameter\_group\_description) | n/a | `string` | `"Aurora PG Parameter Group"` | no |
| <a name="input_db_parameter_group_family"></a> [db\_parameter\_group\_family](#input\_db\_parameter\_group\_family) | n/a | `string` | `"aurora-postgresql14"` | no |
| <a name="input_db_parameter_group_name"></a> [db\_parameter\_group\_name](#input\_db\_parameter\_group\_name) | Name of the DB paramater group | `string` | n/a | yes |
| <a name="input_db_parameter_group_parameters"></a> [db\_parameter\_group\_parameters](#input\_db\_parameter\_group\_parameters) | n/a | `list(any)` | n/a | yes |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | DB subnet group name | `string` | n/a | yes |
| <a name="input_deletion_protection"></a> [deletion\_protection](#input\_deletion\_protection) | n/a | `bool` | `true` | no |
| <a name="input_enabled_cloudwatch_logs_exports"></a> [enabled\_cloudwatch\_logs\_exports](#input\_enabled\_cloudwatch\_logs\_exports) | n/a | `list(string)` | <pre>[<br/>  "postgresql"<br/>]</pre> | no |
| <a name="input_engine"></a> [engine](#input\_engine) | The name of the database engine to be used for this DB cluster. Defaults to `aurora`. Valid Values: `aurora`, `aurora-mysql`, `aurora-postgresql` | `string` | `"aurora-postgresql"` | no |
| <a name="input_engine_lifecycle_support"></a> [engine\_lifecycle\_support](#input\_engine\_lifecycle\_support) | n/a | `string` | `"open-source-rds-extended-support"` | no |
| <a name="input_final_snapshot_identifier"></a> [final\_snapshot\_identifier](#input\_final\_snapshot\_identifier) | n/a | `string` | n/a | yes |
| <a name="input_iam_database_authentication_enabled"></a> [iam\_database\_authentication\_enabled](#input\_iam\_database\_authentication\_enabled) | n/a | `bool` | `true` | no |
| <a name="input_kms_key_id"></a> [kms\_key\_id](#input\_kms\_key\_id) | The ARN for the KMS encryption key. When specifying `kms_key_id`, `storage_encrypted` needs to be set to `true` | `string` | `null` | no |
| <a name="input_master_user_password_rotation_days"></a> [master\_user\_password\_rotation\_days](#input\_master\_user\_password\_rotation\_days) | n/a | `number` | `"90"` | no |
| <a name="input_private_subnets"></a> [private\_subnets](#input\_private\_subnets) | Private subnet IDs | `list(string)` | n/a | yes |
| <a name="input_security_group_rules"></a> [security\_group\_rules](#input\_security\_group\_rules) | Rules for the security group | `any` | n/a | yes |
| <a name="input_security_group_tags"></a> [security\_group\_tags](#input\_security\_group\_tags) | Additional tags for the security group | `map(string)` | `{}` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | n/a | `bool` | `false` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Specifies whether the DB cluster is encrypted. The default is `true` | `bool` | `true` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | A map of tags to add to all resources | `map(string)` | `{}` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | VPC ID | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_arn"></a> [cluster\_arn](#output\_cluster\_arn) | Amazon Resource Name (ARN) of cluster |
| <a name="output_cluster_database_name"></a> [cluster\_database\_name](#output\_cluster\_database\_name) | Name for an automatically created database on cluster creation |
| <a name="output_cluster_endpoint"></a> [cluster\_endpoint](#output\_cluster\_endpoint) | Writer endpoint for the cluster |
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | The RDS Cluster Identifier |
| <a name="output_cluster_port"></a> [cluster\_port](#output\_cluster\_port) | The database port |
| <a name="output_db_subnet_group_name"></a> [db\_subnet\_group\_name](#output\_db\_subnet\_group\_name) | The db subnet group name |
<!-- END_TF_DOCS -->