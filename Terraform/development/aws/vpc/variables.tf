variable "networks_use1" {
  default = {
    "skylab" = {
      azs  = ["us-east-1a", "us-east-1c"]
      cidr = "192.168.0.0/16"
      # enable_nat_gateway = true
      map_public_ip_on_launch = true
      private_subnets         = ["192.168.0.0/24", "192.168.1.0/24"]
      public_subnets          = ["192.168.10.0/24", "192.168.11.0/24"]
      # single_nat_gateway = true
      tags = {
        environment = "dev"
        node_group  = "small"
        project     = "skylab"
        network     = "private"
      }
    }
  }
}
