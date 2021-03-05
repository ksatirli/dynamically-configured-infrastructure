# see https://registry.terraform.io/providers/hashicorp/random/3.0.1
provider "random" {}

# see https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/pet
resource "random_pet" "operator" {
  length    = 2
  separator = "-"
}
