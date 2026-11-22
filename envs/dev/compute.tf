locals {
  template_path = "${path.module}/../../templates/fake-service.sh.tftpl"
  message       = "HelloCloudBank | Retail Banking"
}

module "compute" {
  source = "../../modules/ec2"

  key_name = var.key_name

  customer_profile_subnet_ids = module.network.customer_profile_vpc_public_subnets
  account_subnet_ids          = module.network.account_vpc_private_subnets
  statement_subnet_ids        = module.network.state_vpc_private_subnets

  bastion_sg_id  = module.security.bastion_sg_id
  cp_ec2_sg_id   = module.security.cp_ec2_sg_id
  acc_ec2_sg_id  = module.security.acc_ec2_sg_id
  stmt_ec2_sg_id = module.security.stmt_ec2_sg_id

  stmt_user_data = templatefile(local.template_path, {
    binary_url = module.artifacts.fake_service_url
    port       = 9093
    name       = "statement-svc"
    message    = "${local.message} | statement-svc"
    upstream   = ""
  })

  acc_user_data = templatefile(local.template_path, {
    binary_url = module.artifacts.fake_service_url
    port       = 9092
    name       = "account-svc"
    message    = "${local.message} | account-svc"
    upstream   = "http://statement.internal.${var.zone_name}:8083"
  })

  cp_user_data = templatefile(local.template_path, {
    binary_url = module.artifacts.fake_service_url
    port       = 9091
    name       = "customer-profile-svc"
    message    = "${local.message} | customer-profile-svc"
    upstream   = "http://account.internal.${var.zone_name}:8082"
  })
}
