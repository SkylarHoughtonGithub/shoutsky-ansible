module "vpc_use1" {
  source                  = "terraform-aws-modules/vpc/aws"
  version                 = "~> 5.0"
  for_each                = var.networks_use1
  azs                     = each.value.azs
  cidr                    = each.value.cidr
  enable_nat_gateway      = try(each.value.enable_nat_gateway, false)
  enable_vpn_gateway      = try(each.value.enable_vpn_gateway, false)
  map_public_ip_on_launch = each.value.map_public_ip_on_launch
  name                    = each.key
  one_nat_gateway_per_az  = try(each.value.one_nat_gateway_per_az, false)
  private_subnets         = each.value.private_subnets
  public_subnets          = try(each.value.public_subnets, null)
  single_nat_gateway      = try(each.value.single_nat_gateway, false)
  tags                    = try(each.value.tags, null)
  providers = {
    aws = aws.use1
  }
}
