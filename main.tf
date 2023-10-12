terraform {
  required_providers {
    terratowns = {
      source = "local.providers/local/terratowns"
      version = "1.0.0"
    }
  }

  #backend "remote" {
  #  hostname = "app.terraform.io"
  #  organization = "jrowan"

  #  workspaces {
  #    name = "terra-house-jr"
  #  }
  #}
  cloud {
    organization = "jrowan"
    workspaces {
      name = "terra-house-jr"
    }
  }

}

provider "terratowns" {
  endpoint = var.terratowns_endpoint
  user_uuid = var.teacherseat_user_uuid
  token=var.terratowns_access_token
}

module "home_capetown_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.capetown.public_path
  content_version = var.capetown.content_version
}

resource "terratowns_home" "home" {
  name = "Cape Town - South Africa!"
  description = <<DESCRIPTION
Cape Town, nestled at the southern tip of South Africa, 
is a captivating tourist destination renowned for its 
breathtaking natural beauty, diverse cultural heritage, 
and vibrant urban life. The city's iconic Table Mountain, 
a UNESCO World Heritage site, provides a stunning backdrop 
to a landscape that includes pristine beaches, lush vineyards, 
and lush gardens. 
DESCRIPTION
  domain_name = module.home_capetown_hosting.domain_name
  town = "the-nomad-pad"
  content_version = var.capetown.content_version
}

module "home_cod_hosting" {
  source = "./modules/terrahome_aws"
  user_uuid = var.teacherseat_user_uuid
  public_path = var.cod.public_path
  content_version = var.cod.content_version
}

resource "terratowns_home" "home_cod" {
  name = "Call Of Duty"
  description = <<DESCRIPTION
Call of Duty" is a highly popular video game franchise
known for its intense first-person shooter gameplay and
engaging multiplayer modes. With a series of titles spanning 
different historical eras and modern warfare scenarios, 
it offers players a diverse and immersive gaming experience. 
Its fast-paced action, realistic graphics, and competitive
online multiplayer have made it a beloved series for gamers worldwide.
DESCRIPTION
  domain_name = module.home_cod_hosting.domain_name
  town = "missingo"
  content_version = var.cod.content_version
}
 