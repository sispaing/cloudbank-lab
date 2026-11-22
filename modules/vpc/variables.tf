variable "customer_profile_vpc_name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "customer-profile-vpc"
}

variable "customer_profile_vpc_cidr" {
  description = "The IPv4 CIDR block for the VPC"
  type        = string
  default     = "10.10.0.0/16"
}

variable "customer_profile_vpc_azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "customer_profile_vpc_public_subnets" {
  description = "A list of public subnets inside the VPC"
  type        = list(string)
  default     = ["10.10.1.0/24", "10.10.2.0/24"]
}

variable "customer_profile_vpc_public_subnet_names" {
  description = "Names for the public subnets"
  type        = list(string)
  default     = ["cp-1a-public-subnet", "cp-1b-public-subnet"]
}

variable "customer_profile_vpc_public_map_public_ip_on_launch" {
  description = "Specify true to indicate that instances launched into the subnet should be assigned a public IP address. Default is `false`"
  type        = bool
  default     = true
}

variable "account_vpc_name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "account-vpc"
}

variable "account_vpc_cidr" {
  description = "The IPv4 CIDR block for the VPC"
  type        = string
  default     = "10.11.0.0/16"
}

variable "account_vpc_azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "account_vpc_private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = ["10.11.1.0/24", "10.11.2.0/24"]
}

variable "account_vpc_private_subnet_names" {
  description = "Names for the private subnets"
  type        = list(string)
  default     = ["acc-1a-private-subnet", "acc-1b-private-subnet"]
}

variable "state_vpc_name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = "statement-vpc"
}

variable "state_vpc_cidr" {
  description = "The IPv4 CIDR block for the VPC"
  type        = string
  default     = "10.12.0.0/16"
}

variable "state_vpc_azs" {
  description = "A list of availability zones names or ids in the region"
  type        = list(string)
  default     = ["ap-southeast-1a", "ap-southeast-1b"]
}

variable "state_vpc_private_subnets" {
  description = "A list of private subnets inside the VPC"
  type        = list(string)
  default     = ["10.12.1.0/24", "10.12.2.0/24"]
}

variable "state_vpc_private_subnet_names" {
  description = "Names for the private subnets"
  type        = list(string)
  default     = ["state-1a-private-subnet", "state-1b-private-subnet"]
}
