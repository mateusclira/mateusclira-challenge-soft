terraform {
  backend "azurerm" {}
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.46.0"
    }
  }
}

provider "azurerm" {
  subscription_id = var.SUBSCRIPTION_ID
  features {}
}

module "aks" {
  source = "./aks"
  cname  = var.cname
  region = var.region
  env_id = var.ENV_ID
}

# module "akv" {
#   source = "./akv"
#   cname  = var.cname
#   region = var.region

#   depends_on = [
#     azurerm_resource_group.main
#   ]
# }

# module "kms" {
#   source = "./kms"
#   cname  = var.cname
#   region = var.region
  
#   akv_id = module.akv.kv_id

#   depends_on = [
#     azurerm_resource_group.main
#   ]
# }