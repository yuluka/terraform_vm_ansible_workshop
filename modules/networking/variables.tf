variable "location" {
  type        = string
}

variable "resource_group_name" {
  type        = string
}

variable "vnet_name" {
  description = "Virtual Network Name"
  type        = string
  default     = "mi_primera_vm_vnet"
}

variable "vnet_address_space" {
  description = "Virtual Network Address Space"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

variable "subnet_name" {
  description = "Subnet Name"
  type        = string
  default     = "mi_primera_vm_subnet"
}

variable "subnet_prefix" {
  description = "CIDR block for the subnet"
  type        = list(string)
  default     = ["10.0.2.0/24"]
}

variable "public_ip_name" {
  description = "Public IP Name"
  type        = string
  default     = "mi_primera_vm_public_ip"
}

variable "public_ip_allocation_method" {
  description = "Public IP Allocation Method"
  type        = string
  default     = "Static"
}