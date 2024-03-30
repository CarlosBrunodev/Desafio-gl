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

  backend "azurerm" {
    resource_group_name  = "dev-app-rg"
    storage_account_name = "devappaccount"
    container_name       = "terraformstate"
    key                  = "terraform/autopilot/teste-vm/state"
  }
}