variable "resource_group_name" {
  type    = string
  default = "dev-app-rg"
}

variable "storage_account" {
  type    = string
  default = "devappaccount"
}

variable "default_location" {
  type    = string
  default = "West US"
}

variable "name_storage_contianer" {
  type    = string
  default = "terraformstate"
}

variable "container_type" {
  type    = string
  default = "private"
}

variable "https_traffic_account" {
  type    = bool
  default = true
}

variable "replication_type" {
  type    = string
  default = "LRS"
}

variable "account_tier" {
  type    = string
  default = "Standard"
}
