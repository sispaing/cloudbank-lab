variable "cp_acc_peering_name" {
  description = "cp-acc peering name"
  type        = string
  default     = "pcx-cp-acc"
}

variable "acc_stmt_peering_name" {
  description = "acc-stmt peering name"
  type        = string
  default     = "pcx-acc-stmt"
}

variable "customer_profile_vpc_id" {
  description = "ID of the customer-profile VPC"
  type        = string
}

variable "customer_profile_vpc_cidr" {
  description = "CIDR of the customer-profile VPC"
  type        = string
}

variable "customer_profile_route_table_ids" {
  description = "Route table IDs in the customer-profile VPC"
  type        = list(string)
}

variable "account_vpc_id" {
  description = "ID of the account VPC"
  type        = string
}

variable "account_vpc_cidr" {
  description = "CIDR of the account VPC"
  type        = string
}

variable "account_route_table_ids" {
  description = "Route table IDs in the account VPC"
  type        = list(string)
}

variable "statement_vpc_id" {
  description = "ID of the statement VPC"
  type        = string
}

variable "statement_vpc_cidr" {
  description = "CIDR of the statement VPC"
  type        = string
}

variable "statement_route_table_ids" {
  description = "Route table IDs in the statement VPC"
  type        = list(string)
}
