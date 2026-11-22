variable "zone_name" {
  description = "Route 53 hosted zone"
  type        = string
}

variable "bank_subdomain" {
  description = "Subdomain for the bank site"
  type        = string
  default     = "bank"
}

variable "cp_alb_dns_name" {
  type = string
}

variable "cp_alb_zone_id" {
  type = string
}

variable "acc_lb_dns_name" {
  type = string
}

variable "acc_lb_zone_id" {
  type = string
}

variable "stmt_alb_dns_name" {
  type = string
}

variable "stmt_alb_zone_id" {
  type = string
}
