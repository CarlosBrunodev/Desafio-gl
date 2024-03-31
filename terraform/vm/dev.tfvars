count-net                     = 2
vnet-name                     = "devapp"
address                       = ["10.0.0.0/16"]
location                      = "West US"
resource-group-name           = "dev-app-rg"
allocation                    = "Static"
ip-config-name                = "testconfiguration1"
private_ip_address_allocation = "Dynamic"
vm-name                       = "devapp"
vm-size                       = "Standard_DS1_v2"
vm-admin-username             = "adminuser"
os-disk-caching               = "ReadWrite"
os-disk-storage-account-type  = "Standard_LRS"
vm-image-publisher            = "Canonical"
vm-image-offer                = "0001-com-ubuntu-server-jammy"
vm-image-sku                  = "22_04-lts"
vm-image-version              = "latest"

