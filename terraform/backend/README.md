<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.75.0 |
| <a name="requirement_helm"></a> [helm](#requirement\_helm) | >= 2.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.75.0 |

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_group.this](https://registry.terraform.io/providers/hashicorp/azurerm/3.75.0/docs/resources/resource_group) | resource |
| [azurerm_storage_account.tfstateac](https://registry.terraform.io/providers/hashicorp/azurerm/3.75.0/docs/resources/storage_account) | resource |
| [azurerm_storage_container.tfstate](https://registry.terraform.io/providers/hashicorp/azurerm/3.75.0/docs/resources/storage_container) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_default_location"></a> [default\_location](#input\_default\_location) | n/a | `string` | `"West US"` | no |
| <a name="input_resgroup_name"></a> [resgroup\_name](#input\_resgroup\_name) | n/a | `string` | `"dev-app-rg"` | no |
| <a name="input_storage_account"></a> [storage\_account](#input\_storage\_account) | n/a | `string` | `"dev-app-tf"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->