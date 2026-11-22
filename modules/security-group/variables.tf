variable "my_ip" {
  description = "My public IP for bastion SSH"
  type        = string
}

variable "customer_profile_vpc_id" {
  description = "ID of the customer-profile VPC"
  type        = string
}

variable "customer_profile_vpc_cidr" {
  description = "CIDR of the customer-profile VPC"
  type        = string
}

variable "account_vpc_id" {
  description = "ID of the account VPC"
  type        = string
}

variable "account_vpc_cidr" {
  description = "CIDR of the account VPC"
  type        = string
}

variable "statement_vpc_id" {
  description = "ID of the statement VPC"
  type        = string
}
