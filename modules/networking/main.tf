resource "azurerm_virtual_network" "mi_primera_vm_vnet" {
  name                = var.vnet_name
  address_space       = var.vnet_address_space
  location            = var.location
  resource_group_name = var.resource_group_name
}

resource "azurerm_subnet" "mi_primera_vm_subnet" {
  name                 = var.subnet_name
  resource_group_name  = var.resource_group_name
  virtual_network_name = azurerm_virtual_network.mi_primera_vm_vnet.name
  address_prefixes     = var.subnet_prefix
}

resource "azurerm_public_ip" "mi_primera_vm_public_ip" {
  name                = var.public_ip_name
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = var.public_ip_allocation_method
}