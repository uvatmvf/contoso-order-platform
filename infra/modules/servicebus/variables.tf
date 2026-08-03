variable "name" {
  description = "Name of the Service Bus namespace."
  type        = string
}

variable "resource_group_name" {
  description = "Resource group containing the namespace."
  type        = string
}

variable "location" {
  description = "Azure region for the namespace."
  type        = string
}

variable "sku" {
  description = "Service Bus namespace SKU."
  type        = string
  default     = "Standard"

  validation {
    condition     = contains(["Basic", "Standard", "Premium"], var.sku)
    error_message = "Service Bus SKU must be Basic, Standard, or Premium."
  }
}

variable "queues" {
  description = "Queues to create in the namespace."

  type = map(object({
    name                                 = string
    lock_duration                        = optional(string, "PT1M")
    max_delivery_count                   = optional(number, 10)
    dead_lettering_on_message_expiration = optional(bool, true)
  }))

  default = {}
}

variable "topic_name" {
  description = "Name of the order-events topic."
  type        = string
}

variable "subscriptions" {
  description = "Subscriptions to create beneath the topic."

  type = map(object({
    name               = string
    max_delivery_count = optional(number, 10)
  }))

  default = {}
}

variable "tags" {
  description = "Tags applied to the Service Bus namespace."
  type        = map(string)
  default     = {}
}