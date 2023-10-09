variable "clusters_use1" {
  default = {
    "skylab" = {
      cluster_version                        = "1.27"
      cluster_endpoint_public_access         = true
      enable_coredns                         = true
      enable_kube_proxy                      = true
      enable_vpc_cni                         = true
      vpc_id                                 = "vpc-0f6c219833fe92be7"
      subnet_ids                             = ["subnet-04610b8b2e54b8972", "subnet-0f91e00155d822ebd"]
      control_plane_subnet_ids               = ["subnet-04610b8b2e54b8972", "subnet-0f91e00155d822ebd"]
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
      aws_auth_roles = [
        {
          rolearn  = "arn:aws:iam::635314249418:role/eksAdmin"
          username = "eksAdmin"
          groups   = ["system:masters"]
        },
      ]
      aws_auth_users = [
        {
          userarn  = "arn:aws:iam::635314249418:user/chicken"
          username = "chicken"
          groups   = ["view"]
        },
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
