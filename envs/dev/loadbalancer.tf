module "alb" {
  source = "../../modules/alb"

  certificate_arn = module.acm.certificate_arn

  customer_profile_vpc_id     = module.network.customer_profile_vpc_id
  customer_profile_subnet_ids = module.network.customer_profile_vpc_public_subnets

  account_vpc_id     = module.network.account_vpc_id
  account_subnet_ids = module.network.account_vpc_private_subnets

  statement_vpc_id     = module.network.state_vpc_id
  statement_subnet_ids = module.network.state_vpc_private_subnets

  cp_alb_sg_id   = module.security.cp_alb_sg_id
  acc_alb_sg_id  = module.security.acc_alb_sg_id
  stmt_alb_sg_id = module.security.stmt_alb_sg_id

  cp_instance_ids   = module.compute.cp_instance_ids
  acc_instance_ids  = module.compute.acc_instance_ids
  stmt_instance_ids = module.compute.stmt_instance_ids
}
