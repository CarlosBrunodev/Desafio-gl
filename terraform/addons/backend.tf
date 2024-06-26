provider "azurerm" {
  features {}

  subscription_id = "9317fcc6-c07b-498e-bcc2-9bb771806102"
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
    storage_account_name = "devappaccountcb"
    container_name       = "terraformstate"
    key                  = "terraform/autopilot/addons/state"
  }
}