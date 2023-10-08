variable "module_version" { default = "~> 19.0" }
variable "clusters" {
  default = {
    "skylab" = {
      cluster_version                        = "1.27"
      cluster_endpoint_public_access         = true
      enable_coredns                         = true
      enable_kube_proxy                      = true
      enable_vpc_cni                         = true
      vpc_id                                 = "" #TODO: dynamically pull based on vpc name
      subnet_ids                             = []
      control_plane_subnet_ids               = []
      update_launch_template_default_version = true
      eks_managed_node_groups = {
        small = {
          min_size       = 1
          max_size       = 2
          desired_size   = 1
          instance_types = ["t3.small"]
          capacity_type  = "ON_DEMAND"
        }
      }
      eks_managed_node_group_defaults = {
        instance_types = ["t3.small"]
      }
      manage_aws_auth_configmap = true
      #   aws_auth_roles = [
      #     {
      #       rolearn  = "arn:aws:iam::66666666666:role/role1"
      #       username = "role1"
      #       groups   = ["system:masters"]
      #     },
      #   ]
      aws_auth_users = [
        {
          userarn  = "arn:aws:iam::635314249418:user/egg"
          username = "egg"
          groups   = ["system:masters"]
        },
      ]
      aws_auth_accounts = ["635314249418"]
      tags = {
        environment = "dev"
        node_group  = "small"
        project     = "skylab"
        network     = "private"
        storage     = "stateless"
      }
    }
  }
}