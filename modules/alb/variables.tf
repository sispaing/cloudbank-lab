variable "certificate_arn" {
  description = "ACM cert ARN for cp-alb"
  type        = string
}

variable "customer_profile_vpc_id" {
  type = string
}

variable "customer_profile_subnet_ids" {
  type = list(string)
}

variable "account_vpc_id" {
  type = string
}

variable "account_subnet_ids" {
  type = list(string)
}

variable "statement_vpc_id" {
  type = string
}

variable "statement_subnet_ids" {
  type = list(string)
}

variable "cp_alb_sg_id" {
  type = string
}

variable "acc_alb_sg_id" {
  type = string
}

variable "stmt_alb_sg_id" {
  type = string
}

variable "cp_instance_ids" {
  type = map(string)
}

variable "acc_instance_ids" {
  type = map(string)
}

variable "stmt_instance_ids" {
  type = map(string)
}
