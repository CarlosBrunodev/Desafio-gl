provider "azurerm" {
  features {}
}

terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.75.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = ">= 2.1.0"
    }
  }
}

resource "azurerm_resource_group" "dev-rg" {
  name     = var.resource_group_name
  location = var.default_location

  tags = {
    Projeto     = "cb"
    Environment = "Dev"
  }
}

resource "azurerm_storage_account" "dev-ac" {
  name                      = var.storage_account
  resource_group_name       = var.resource_group_name
  location                  = var.default_location
  account_tier              = var.account_tier
  account_replication_type  = var.replication_type
  enable_https_traffic_only = var.https_traffic_account

  tags = {
    Projeto     = "cb"
    Environment = "Dev"
  }

  depends_on = [
    azurerm_resource_group.dev-rg
  ]
}

resource "azurerm_storage_container" "dev-contianer" {
  name                  = var.name_storage_contianer
  storage_account_name  = var.storage_account
  container_access_type = var.container_type

  depends_on = [
    azurerm_storage_account.dev-ac,  
    azurerm_resource_group.dev-rg
  ]


}