# see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_group
resource "azurerm_resource_group" "platform" {
  name     = local.project_name
  location = var.region

  tags = var.tags
}
