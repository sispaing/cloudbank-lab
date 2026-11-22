module "network" {
  source = "../../modules/vpc"
}

module "peering" {
  source = "../../modules/vpc-peering"

  customer_profile_vpc_id          = module.network.customer_profile_vpc_id
  customer_profile_vpc_cidr        = module.network.customer_profile_vpc_cidr_block
  customer_profile_route_table_ids = module.network.customer_profile_vpc_public_route_table_ids

  account_vpc_id          = module.network.account_vpc_id
  account_vpc_cidr        = module.network.account_vpc_cidr_block
  account_route_table_ids = module.network.account_vpc_private_route_table_ids

  statement_vpc_id          = module.network.state_vpc_id
  statement_vpc_cidr        = module.network.state_vpc_cidr_block
  statement_route_table_ids = module.network.state_vpc_private_route_table_ids
}

module "artifacts" {
  source = "../../modules/artifacts"

  region            = var.region
  fake_service_path = var.fake_service_path

  customer_profile_vpc_id          = module.network.customer_profile_vpc_id
  customer_profile_route_table_ids = module.network.customer_profile_vpc_public_route_table_ids

  account_vpc_id          = module.network.account_vpc_id
  account_route_table_ids = module.network.account_vpc_private_route_table_ids

  statement_vpc_id          = module.network.state_vpc_id
  statement_route_table_ids = module.network.state_vpc_private_route_table_ids
}
