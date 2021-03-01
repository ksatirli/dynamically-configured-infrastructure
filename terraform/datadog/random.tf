# see https://registry.terraform.io/providers/hashicorp/random/3.0.1
provider "random" { }

#######################################################################################################################################
#
# WARNING: this is _NOT_ a best practice as the password will be stored as an unencrypted string in your Terraform State file.
# WARNING: See https://www.terraform.io/docs/language/state/sensitive-data.html for information about handling sensitive data.
#
#######################################################################################################################################

# see https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password
resource "random_password" "datadog" {
  length  = 64
  special = true
}
