variable "networks_use1" {
  default = {
    "skylab" = {
      # enable_nat_gateway = true
      # single_nat_gateway = true
      cidr            = "192.168.0.0/16"
      azs             = ["us-east-1a", "us-east-1c"]
      private_subnets = ["192.168.0.0/24", "192.168.1.0/24"]
      public_subnets  = ["192.168.10.0/24", "192.168.11.0/24"]
      tags = {
        environment = "dev"
        node_group  = "small"
        project     = "skylab"
        network     = "private"
      }
    }
  }
}
