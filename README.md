# Dynamically Configured Infrastructure

> Dynamically configured infrastructure with Terraform, Consul, and Microsoft Azure

## Table of Contents

- [Dynamically Configured Infrastructure](#dynamically-configured-infrastructure)
  - [Table of Contents](#table-of-contents)
  - [Important Links](#important-links)
  - [Requirements](#requirements)
  - [Workflows](#workflows)
  - [Additional Reading](#additional-reading)
  - [Author Information](#author-information)
  - [License](#license)

## Important Links

* Slides: [speakerdeck.com/ksatirli/dynamically-configured-infrastructure](https://speakerdeck.com/ksatirli/dynamically-configured-infrastructure)
* Code: [github.com/ksatirli/dynamically-configured-infrastructure](https://github.com/ksatirli/dynamically-configured-infrastructure)

## Requirements

To use the code in this repository, you will need the following applications:

* [HashiCorp Terraform](https://www.terraform.io/downloads.html) `0.14.9` (or later)
* [HashiCorp Consul](https://www.consul.io/downloads) `1.9.4` (or later)
* Azure CLI [az](https://docs.microsoft.com/en-us/cli/azure/) `2.0.0` (or later)

## Workflows

The code in this repository is split out into a handful of distinct flows, each in their own directory:

* `terraform/azure` contains code for Terraform to set up an Azure Resource Group and generate a Packer variables definition file
* `terraform/kubernetes` contains code for Terraform to start a Linux Virtual Machine with the Packer image
* `consul` contains a Shipyard blueprint for running a pre-configured Consul server

Each directory contains its own `README.md` with information relevant to the workflow.

## Additional Reading

While the authors of this repository take care to explain all workflows with the amount of detail required to execute them, the information here should not be considered exhaustive.

This section is a collection of links that will help you make the most of today's session.

### Terraform

* introduction to the Terraform Ecosystem: [speakerdeck.com/ksatirli/intro-to-the-terraform-ecosystem](https://speakerdeck.com/ksatirli/intro-to-the-terraform-ecosystem)
* CLI commands [terraform.io/docs/commands/index.html](https://www.terraform.io/docs/commands/index.html)
* variables and type constraints: [terraform.io/docs/configuration/variables.html](https://www.terraform.io/docs/configuration/variables.html#type-constraints)
* variable definition files: [terraform.io/docs/configuration/variables.html](https://www.terraform.io/docs/configuration/variables.html#variable-definitions-tfvars-files)
* information about Terraform State: [terraform.io/docs/state/index.html](https://www.terraform.io/docs/state/index.html)
* in-depth guides on how to use Terraform: [learn.hashicorp.com/terraform](https://learn.hashicorp.com/terraform)
* Terraform Code Quality: [speakerdeck.com/ksatirli/code-quality-for-terraform](https://speakerdeck.com/ksatirli/code-quality-for-terraform)

### Consul

* CLI commands [consul.io/commands](https://www.consul.io/commands)

## Author Information

This repository is maintained by [Kerim Satirli](https://github.com/ksatirli) and [Tom Harvey](https://github.com/tombuildsstuff).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0).

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
