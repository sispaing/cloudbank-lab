variable "region" {
  description = "AWS region"
  type        = string
  default     = "ap-southeast-1"
}

variable "bucket_prefix" {
  description = "Bucket name prefix"
  type        = string
  default     = "cloudbank-artifacts-"
}

variable "fake_service_path" {
  description = "Local path to fake-service binary"
  type        = string
}

variable "customer_profile_vpc_id" {
  type = string
}

variable "customer_profile_route_table_ids" {
  type = list(string)
}

variable "account_vpc_id" {
  type = string
}

variable "account_route_table_ids" {
  type = list(string)
}

variable "statement_vpc_id" {
  type = string
}

variable "statement_route_table_ids" {
  type = list(string)
}
