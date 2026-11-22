module "security" {
  source = "../../modules/security-group"

  my_ip = var.my_ip

  customer_profile_vpc_id   = module.network.customer_profile_vpc_id
  customer_profile_vpc_cidr = module.network.customer_profile_vpc_cidr_block

  account_vpc_id   = module.network.account_vpc_id
  account_vpc_cidr = module.network.account_vpc_cidr_block

  statement_vpc_id = module.network.state_vpc_id
}
