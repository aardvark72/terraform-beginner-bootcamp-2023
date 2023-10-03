terraform {
  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "jrowan"

  #  workspaces {
  #    name = "terra-house-jr"
  #  }
  #}
  #cloud {
  #  organization = "jrowan"
  #  workspaces {
  #    name = "terra-house-jr"
  #  }
  #}
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.2"
    }
  }
}

provider "aws" {
}
provider "random" {
  # Configuration options
}