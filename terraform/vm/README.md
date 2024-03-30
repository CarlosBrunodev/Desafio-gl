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
| <a name="provider_template"></a> [template](#provider\_template) | 2.2.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_linux_virtual_machine.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.75.0/docs/resources/linux_virtual_machine) | resource |
| [azurerm_network_interface.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.75.0/docs/resources/network_interface) | resource |
| [azurerm_public_ip.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.75.0/docs/resources/public_ip) | resource |
| [azurerm_subnet.internal](https://registry.terraform.io/providers/hashicorp/azurerm/3.75.0/docs/resources/subnet) | resource |
| [azurerm_user_assigned_identity.example](https://registry.terraform.io/providers/hashicorp/azurerm/3.75.0/docs/resources/user_assigned_identity) | resource |
| [azurerm_virtual_network.main](https://registry.terraform.io/providers/hashicorp/azurerm/3.75.0/docs/resources/virtual_network) | resource |
| [template_file.linux-vm-cloud-init](https://registry.terraform.io/providers/hashicorp/template/latest/docs/data-sources/file) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_address"></a> [address](#input\_address) | n/a | `list` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | no |
| <a name="input_allocation"></a> [allocation](#input\_allocation) | n/a | `string` | `"Static"` | no |
| <a name="input_count-net"></a> [count-net](#input\_count-net) | n/a | `number` | `2` | no |
| <a name="input_ip-config-name"></a> [ip-config-name](#input\_ip-config-name) | n/a | `string` | `"testconfiguration1"` | no |
| <a name="input_location"></a> [location](#input\_location) | n/a | `string` | `"West US"` | no |
| <a name="input_os-disk-caching"></a> [os-disk-caching](#input\_os-disk-caching) | n/a | `string` | `"ReadWrite"` | no |
| <a name="input_os-disk-storage-account-type"></a> [os-disk-storage-account-type](#input\_os-disk-storage-account-type) | n/a | `string` | `"Standard_LRS"` | no |
| <a name="input_private_ip_address_allocation"></a> [private\_ip\_address\_allocation](#input\_private\_ip\_address\_allocation) | n/a | `string` | `"Dynamic"` | no |
| <a name="input_resource-group-name"></a> [resource-group-name](#input\_resource-group-name) | n/a | `string` | `"dev-app-rg"` | no |
| <a name="input_vm-admin-username"></a> [vm-admin-username](#input\_vm-admin-username) | n/a | `string` | `"adminuser"` | no |
| <a name="input_vm-image-offer"></a> [vm-image-offer](#input\_vm-image-offer) | n/a | `string` | `"0001-com-ubuntu-server-jammy"` | no |
| <a name="input_vm-image-publisher"></a> [vm-image-publisher](#input\_vm-image-publisher) | n/a | `string` | `"Canonical"` | no |
| <a name="input_vm-image-sku"></a> [vm-image-sku](#input\_vm-image-sku) | n/a | `string` | `"22_04-lts"` | no |
| <a name="input_vm-image-version"></a> [vm-image-version](#input\_vm-image-version) | n/a | `string` | `"latest"` | no |
| <a name="input_vm-name"></a> [vm-name](#input\_vm-name) | n/a | `string` | `"devapp"` | no |
| <a name="input_vm-size"></a> [vm-size](#input\_vm-size) | n/a | `string` | `"Standard_DS1_v2"` | no |
| <a name="input_vnet-name"></a> [vnet-name](#input\_vnet-name) | n/a | `string` | `"devapp"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_web_linux_vm_ip_address"></a> [web\_linux\_vm\_ip\_address](#output\_web\_linux\_vm\_ip\_address) | Virtual Machine name IP Address |
<!-- END_TF_DOCS -->