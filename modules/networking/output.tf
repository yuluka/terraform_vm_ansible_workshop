output "subnet_id" {
  value = azurerm_subnet.mi_primera_vm_subnet.id
}

output "public_ip_address_id" {
  value = azurerm_public_ip.mi_primera_vm_public_ip.id
}