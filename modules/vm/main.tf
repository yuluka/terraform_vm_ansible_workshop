resource "azurerm_network_interface" "mi_primera_vm_nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.private_ip_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_allocation_method
    public_ip_address_id          = var.public_ip_address_id
  }
}

resource "azurerm_network_security_group" "mi_primera_vm_nsg" {
  name                = var.nsg_name
  location            = var.location
  resource_group_name = var.resource_group_name

  dynamic "security_rule" {
    for_each = var.nsg_rules
    content {
      name                       = security_rule.value.name
      priority                   = security_rule.value.priority
      direction                  = security_rule.value.direction
      access                     = security_rule.value.access
      protocol                   = security_rule.value.protocol
      source_port_range          = security_rule.value.source_port_range
      destination_port_range     = security_rule.value.destination_port_range
      source_address_prefix      = security_rule.value.source_address_prefix
      destination_address_prefix = security_rule.value.destination_address_prefix
    }
  }
}

resource "azurerm_network_interface_security_group_association" "mi_primera_vm_nsg_association" {
  network_interface_id      = azurerm_network_interface.mi_primera_vm_nic.id
  network_security_group_id = azurerm_network_security_group.mi_primera_vm_nsg.id
}

resource "azurerm_linux_virtual_machine" "mi_primera_vm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username
  admin_password      = var.admin_password
  network_interface_ids = [
    azurerm_network_interface.mi_primera_vm_nic.id,
  ]

  os_disk {
    caching              = var.os_disk_caching
    storage_account_type = var.os_disk_storage_type
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }

  disable_password_authentication = false
  provision_vm_agent              = true
}