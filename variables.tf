variable "subscription_id" {
  description = "Azure Subscription ID"
  type        = string
  default     = "94101e63-55cd-434a-bf37-69fa8ccffe39"
}

variable "location" {
  description = "Azure region"
  type        = string
  default     = "West Europe"
}

variable "resource_group_name" {
  description = "Resource group name"
  type        = string
  default     = "mi_primera_vm_rg"
}

variable "admin_password" {
  description = "Admin Password"
  type        = string
  sensitive   = true
}