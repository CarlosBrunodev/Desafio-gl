data "template_file" "linux-vm-cloud-init" {
  template = file("bootstrap.sh")
}

## Network

resource "azurerm_virtual_network" "main" {
  name                = var.vnet-name
  address_space       = var.address
  location            = var.location
  resource_group_name = var.resource-group-name
}

resource "azurerm_subnet" "internal" {
  count                = var.count-net
  name                 = "${var.vnet-name}-subnet-${count.index}"
  resource_group_name  = var.resource-group-name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = ["10.0.${count.index + 1}.0/24"]
}

resource "azurerm_public_ip" "example" {
  count                = var.count-net
  name                = "${var.vnet-name}-public-ip-${count.index}"
  location            = var.location
  resource_group_name  = var.resource-group-name
  allocation_method   = var.allocation
}

resource "azurerm_network_interface" "main" {
  count               = var.count-net
  name                = "${var.vnet-name}-interface-${count.index}"
  location            = var.location
  resource_group_name = var.resource-group-name

  ip_configuration {
    name                          = var.ip-config-name
    subnet_id                     = azurerm_subnet.internal[count.index].id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.example[count.index].id
  }
}

## Vm linux

resource "azurerm_linux_virtual_machine" "example" {
  count = 2
  name                  = "${var.vm-name}-vm-${count.index}"
  location              = var.location
  resource_group_name   = var.resource-group-name
  size                  = var.vm-size
  admin_username      = var.vm-admin-username
 # custom_data = base64encode(data.template_file.linux-vm-cloud-init.rendered)
  network_interface_ids = [
    azurerm_network_interface.main[count.index].id
  ]

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("~/.ssh/id_rsa.pub")
  }

  os_disk {
    caching              = var.os-disk-caching
    storage_account_type = var.os-disk-storage-account-type
  }

  source_image_reference {
    publisher = var.vm-image-publisher
    offer     = var.vm-image-offer
    sku       = var.vm-image-sku
    version   = var.vm-image-version
  }
}

resource "azurerm_user_assigned_identity" "example" {
  name                = "${var.vm-name}-uai"
  location            = var.location
  resource_group_name = var.resource-group-name
}