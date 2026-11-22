variable "instance_type" {
  description = "Instance type"
  type        = string
  default     = "t3.micro"
}

variable "key_name" {
  description = "EC2 key pair name"
  type        = string
}

variable "customer_profile_subnet_ids" {
  description = "customer-profile public subnet IDs"
  type        = list(string)
}

variable "account_subnet_ids" {
  description = "account private subnet IDs"
  type        = list(string)
}

variable "statement_subnet_ids" {
  description = "statement private subnet IDs"
  type        = list(string)
}

variable "bastion_sg_id" {
  type = string
}

variable "cp_ec2_sg_id" {
  type = string
}

variable "acc_ec2_sg_id" {
  type = string
}

variable "stmt_ec2_sg_id" {
  type = string
}

variable "cp_user_data" {
  description = "cp user data"
  type        = string
}

variable "acc_user_data" {
  description = "acc user data"
  type        = string
}

variable "stmt_user_data" {
  description = "stmt user data"
  type        = string
}
