provider "azurerm" {
  subscription_id = var.subscription_id
  features {}
}

resource "azurerm_resource_group" "mi_primera_vm_rg" {
  name     = var.resource_group_name
  location = var.location
}

module "networking" {
  source              = "./modules/networking"
  location            = var.location
  resource_group_name = azurerm_resource_group.mi_primera_vm_rg.name
}

module "vm" {
  source              = "./modules/vm"
  location            = var.location
  resource_group_name = azurerm_resource_group.mi_primera_vm_rg.name
  subnet_id           = module.networking.subnet_id
  public_ip_address_id = module.networking.public_ip_address_id
  admin_password      = var.admin_password
}
