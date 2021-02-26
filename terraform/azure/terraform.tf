terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.49.0"
    }

    consul = {
      source  = "hashicorp/consul"
      version = "2.11.0"
    }
  }
}
