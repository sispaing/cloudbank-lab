variable "zone_name" {
  description = "Route 53 hosted zone"
  type        = string
}

variable "bank_subdomain" {
  description = "Subdomain for the bank site"
  type        = string
  default     = "bank"
}
