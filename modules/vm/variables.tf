variable "nic_name" {
  description = "Network Interface Name"
  type        = string
  default     = "mi_primera_vm_nic"
}

variable "subnet_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "location" {
  type = string
}

variable "public_ip_address_id" {
  type = string
}

variable "nsg_name" {
  description = "Network Security Group Name"
  type        = string
  default     = "mi_primera_vm_nsg"
}

variable "nsg_rules" {
  description = "List of NSG security rules"
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_range     = string
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = [
    {
      name                       = "ssh_rule"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
    {
      name                       = "mario_rule"
      priority                   = 101
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "8787"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    },
  ]
}

variable "vm_name" {
  description = "Virtual Machine Name"
  type        = string
  default     = "mi-primera-vm"
}

variable "vm_size" {
  description = "Virtual Machine Size"
  type        = string
  default     = "Standard_B1s"
}

variable "private_ip_name" {
  description = "Private IP Name"
  type        = string
  default     = "internal"
}

variable "private_ip_allocation_method" {
  description = "Private IP Allocation Method"
  type        = string
  default     = "Dynamic"
}

variable "admin_username" {
  description = "Admin Username"
  type        = string
  default     = "adminuser"
}

variable "admin_password" {
  description = "Admin Password"
  type        = string
  sensitive   = true
}

variable "os_disk_caching" {
  description = "OS disk caching policy"
  type        = string
  default     = "ReadWrite"
}

variable "os_disk_storage_type" {
  description = "Storage type for the OS disk"
  type        = string
  default     = "Standard_LRS"
}

variable "source_image_reference" {
  description = "Source Image Reference"
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = string
  })
  default = {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
}
