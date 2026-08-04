variable "name" {
  description = "Name of the Consumption Logic App."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the Logic App."
  type        = string
}

variable "location" {
  description = "Azure region for the Logic App."
  type        = string
}

variable "service_bus_namespace" {
  description = "Fully qualified Service Bus namespace hostname."
  type        = string
}

variable "queue_name" {
  description = "Service Bus queue receiving place-order commands."
  type        = string
}

variable "tags" {
  description = "Tags applied to the Logic App."
  type        = map(string)
  default     = {}
}