terraform {
  # see https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
  required_version = "0.14.9"

  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/azurerm/2.53.0
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.53.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/consul/2.11.0
    consul = {
      source  = "hashicorp/consul"
      version = "2.11.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/hcs/0.2.0
    hcs = {
      source  = "hashicorp/hcs"
      version = "0.2.0"
    }
  }

  # see https://www.terraform.io/docs/language/settings/backends/remote.html
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "a-demo-organization"

    # see https://www.terraform.io/docs/language/settings/backends/remote.html#workspaces
    workspaces {
      name = "dci-consul"
    }
  }
}
