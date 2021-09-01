variable "compartment_id" {
  type        = string
  description = "compartment id where to create the resources"
}


variable "loggroup_tags" {
  type        = map(any)
  description = "Freeform Tags"
  default = {
    "Environment" = "Dev"
  }
}

variable "log_retention_duration" {
  type        = number
  default     = 30
  description = "Log retention duration"
}

variable "lbname" {
  type        = string
  description = "Loadbalancer display name"
}
