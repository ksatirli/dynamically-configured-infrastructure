terraform {
  # see https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
  required_version = "0.14.7"

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
