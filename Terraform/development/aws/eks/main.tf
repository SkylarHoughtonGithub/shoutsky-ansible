# TODO: explore lb module
# TODO: explore secrets module
# TODO: explore private dns and routing

module "eks-use1" {
  source                         = "terraform-aws-modules/eks/aws"
  version                        = "~> 19.0"
  for_each                       = var.clusters_use1
  cluster_name                   = each.key
  cluster_version                = each.value.cluster_version
  cluster_endpoint_public_access = each.value.cluster_endpoint_public_access

  cluster_addons = {
    coredns = {
      most_recent = each.value.enable_coredns
    }
    kube-proxy = {
      most_recent = each.value.enable_kube_proxy
    }
    vpc-cni = {
      most_recent = each.value.enable_vpc_cni
    }
  }
  vpc_id                          = each.value.vpc_id
  subnet_ids                      = each.value.subnet_ids
  control_plane_subnet_ids        = each.value.control_plane_subnet_ids
  eks_managed_node_group_defaults = each.value.eks_managed_node_group_defaults
  eks_managed_node_groups         = each.value.eks_managed_node_groups
  manage_aws_auth_configmap       = each.value.manage_aws_auth_configmap
  create_aws_auth_configmap       = each.value.manage_aws_auth_configmap
  aws_auth_roles                  = try(each.value.aws_auth_roles, null)
  aws_auth_users                  = try(each.value.aws_auth_users, null)
  aws_auth_accounts               = try(each.value.aws_auth_accounts, null)
  tags                            = try(each.value.tags, null)
  providers = {
    aws = aws.use1
  }
}
