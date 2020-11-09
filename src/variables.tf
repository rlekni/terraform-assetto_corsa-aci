variable "purpose" {
  type        = string
  description = "Purpose of these resources"
  default     = "acserver"
}

variable "location" {
  type        = string
  description = "Location of the resources"
  default     = "uksouth"
}

variable "tags" {
  type        = map(string)
  description = "Base tags that should be applied to all resources"
  default     = {}
}

variable "container_resources" {
  type = object({
    cpu    = string
    memory = string
  })
  default = {
    cpu    = "1.0"
    memory = "1.0"
  }
}