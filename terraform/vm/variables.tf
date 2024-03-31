## Network var

variable "count-net" {
  type    = number
  default = 2
}

variable "vnet-name" {
  type    = string
  default = "devapp"
}

variable "address" {
  type    = list(any)
  default = ["10.0.0.0/16"]
}

variable "location" {
  type    = string
  default = "West US"
}

variable "resource-group-name" {
  type    = string
  default = "dev-app-rg"
}

variable "allocation" {
  type    = string
  default = "Static"
}

variable "ip-config-name" {
  type    = string
  default = "testconfiguration1"
}

variable "private_ip_address_allocation" {
  type    = string
  default = "Dynamic"
}

## VM linux

variable "vm-name" {
  type    = string
  default = "devapp"
}

variable "vm-size" {
  type    = string
  default = "Standard_DS1_v2"
}

variable "vm-admin-username" {
  type    = string
  default = "adminuser"
}

variable "os-disk-caching" {
  type    = string
  default = "ReadWrite"
}

variable "os-disk-storage-account-type" {
  type    = string
  default = "Standard_LRS"
}

variable "vm-image-publisher" {
  type    = string
  default = "Canonical"
}

variable "vm-image-offer" {
  type    = string
  default = "0001-com-ubuntu-server-jammy"
}

variable "vm-image-sku" {
  type    = string
  default = "22_04-lts"
}

variable "vm-image-version" {
  type    = string
  default = "latest"
}





