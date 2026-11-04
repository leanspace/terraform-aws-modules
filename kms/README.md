# AWS KMS Terraform module

Terraform module which creates AWS KMS resources.

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kms"></a> [kms](#module\_kms) | terraform-aws-modules/kms/aws | ~> 2.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_kms_aliases"></a> [kms\_aliases](#input\_kms\_aliases) | List of aliases to create for the key | `list(string)` | `[]` | no |
| <a name="input_kms_customer_master_key_spec"></a> [kms\_customer\_master\_key\_spec](#input\_kms\_customer\_master\_key\_spec) | Specifies whether the key contains a symmetric key or an asymmetric key pair and the encryption algorithms | `string` | `"SYMMETRIC_DEFAULT"` | no |
| <a name="input_kms_deletion_window_in_days"></a> [kms\_deletion\_window\_in\_days](#input\_kms\_deletion\_window\_in\_days) | Duration in days after which the key is deleted after destruction of the resource | `number` | `7` | no |
| <a name="input_kms_description"></a> [kms\_description](#input\_kms\_description) | Description for the KMS key | `string` | `null` | no |
| <a name="input_kms_enable_key_rotation"></a> [kms\_enable\_key\_rotation](#input\_kms\_enable\_key\_rotation) | Specifies whether key rotation is enabled | `bool` | `true` | no |
| <a name="input_kms_is_enabled"></a> [kms\_is\_enabled](#input\_kms\_is\_enabled) | Specifies whether the key is enabled | `bool` | `true` | no |
| <a name="input_kms_key_usage"></a> [kms\_key\_usage](#input\_kms\_key\_usage) | Specifies the intended use of the key | `string` | `"ENCRYPT_DECRYPT"` | no |
| <a name="input_kms_policy"></a> [kms\_policy](#input\_kms\_policy) | Full JSON policy to apply to the KMS key | `string` | n/a | yes |
| <a name="input_kms_tags"></a> [kms\_tags](#input\_kms\_tags) | Map of tags to apply to the KMS key | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_key_aliases"></a> [key\_aliases](#output\_key\_aliases) | List of aliases created for the KMS key. |
| <a name="output_key_arn"></a> [key\_arn](#output\_key\_arn) | The Amazon Resource Name (ARN) of the KMS key. |
| <a name="output_key_id"></a> [key\_id](#output\_key\_id) | The globally unique identifier for the KMS key. |
<!-- END_TF_DOCS -->