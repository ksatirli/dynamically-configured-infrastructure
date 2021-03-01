terraform {
  # see https://www.terraform.io/docs/language/settings/index.html#specifying-a-required-terraform-version
  required_version = "0.14.7"

  required_providers {
    # see https://registry.terraform.io/providers/hashicorp/azurerm/2.49.0
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.49.0"
    }

    # see https://registry.terraform.io/providers/DataDog/datadog/2.21.0
    datadog = {
      source  = "DataDog/datadog"
      version = "2.21.0"
    }

    # see https://registry.terraform.io/providers/hashicorp/helm/2.0.2
    helm = {
      source  = "hashicorp/helm"
      version = "2.0.2"
    }
  }

  //  # see https://www.terraform.io/docs/language/settings/backends/remote.html
  //  backend "remote" {
  //    hostname     = "app.terraform.io"
  //    organization = "a-demo-organization"
  //
  //    # see https://www.terraform.io/docs/language/settings/backends/remote.html#workspaces
  //    workspaces {
  //      name = "dci-datadog"
  //    }
  //  }
}
