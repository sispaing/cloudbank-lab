output "customer_profile_vpc_id" {
  description = "The ID of the VPC"
  value       = module.customer_profile_vpc.vpc_id
}

output "customer_profile_vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.customer_profile_vpc.vpc_cidr_block
}

output "customer_profile_vpc_public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.customer_profile_vpc.public_subnets
}

output "customer_profile_vpc_public_route_table_ids" {
  description = "List of IDs of public route tables"
  value       = module.customer_profile_vpc.public_route_table_ids
}

output "account_vpc_id" {
  description = "The ID of the VPC"
  value       = module.account_vpc.vpc_id
}

output "account_vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.account_vpc.vpc_cidr_block
}

output "account_vpc_private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.account_vpc.private_subnets
}

output "account_vpc_private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = module.account_vpc.private_route_table_ids
}

output "state_vpc_id" {
  description = "The ID of the VPC"
  value       = module.state_vpc.vpc_id
}

output "state_vpc_cidr_block" {
  description = "The CIDR block of the VPC"
  value       = module.state_vpc.vpc_cidr_block
}

output "state_vpc_private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.state_vpc.private_subnets
}

output "state_vpc_private_route_table_ids" {
  description = "List of IDs of private route tables"
  value       = module.state_vpc.private_route_table_ids
}
