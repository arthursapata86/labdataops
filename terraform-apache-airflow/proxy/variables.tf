variable "machine" {
  type = object({
    micro = string
    small = string
  })
}

variable "zone" {
  type = object({
    default      = string
    alternative  = string
    alternative1 = string
  })
}

variable "instance_name" {
  type = string
}

variable "image" {
  type        = string
  description = "OS system image of the VMs"
}

variable "vpc_network_name" {
  type = string
}

variable "frontend_instance_address" {
  type = string
}
