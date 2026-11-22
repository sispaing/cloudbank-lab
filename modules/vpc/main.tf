module "customer_profile_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.7.3"

  name                    = var.customer_profile_vpc_name
  cidr                    = var.customer_profile_vpc_cidr
  azs                     = var.customer_profile_vpc_azs
  public_subnets          = var.customer_profile_vpc_public_subnets
  public_subnet_names     = var.customer_profile_vpc_public_subnet_names
  map_public_ip_on_launch = var.customer_profile_vpc_public_map_public_ip_on_launch
}

module "account_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.7.3"

  name                 = var.account_vpc_name
  cidr                 = var.account_vpc_cidr
  azs                  = var.account_vpc_azs
  private_subnets      = var.account_vpc_private_subnets
  private_subnet_names = var.account_vpc_private_subnet_names
}

module "state_vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "6.7.3"

  name                 = var.state_vpc_name
  cidr                 = var.state_vpc_cidr
  azs                  = var.state_vpc_azs
  private_subnets      = var.state_vpc_private_subnets
  private_subnet_names = var.state_vpc_private_subnet_names
}
