module "vpc_use1" {
  source                 = "terraform-aws-modules/vpc/aws"
  version                = "~> 5.0"
  for_each               = var.networks_use1
  name                   = each.key
  cidr                   = each.value.cidr
  azs                    = each.value.azs
  private_subnets        = each.value.private_subnets
  public_subnets         = try(each.value.public_subnets, null)
  enable_nat_gateway     = try(each.value.enable_nat_gateway, false)
  enable_vpn_gateway     = try(each.value.enable_vpn_gateway, false)
  single_nat_gateway     = try(each.value.single_nat_gateway, false)
  one_nat_gateway_per_az = try(each.value.one_nat_gateway_per_az, false)
  tags                   = try(each.value.tags, null)
  providers = {
    aws = aws.use1
  }
}
