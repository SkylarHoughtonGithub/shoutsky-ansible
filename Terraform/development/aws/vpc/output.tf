output "skylab-use1-vpc-id" { value = module.vpc_use1["skylab"].vpc_id }
output "skylab-use1-private-subnet-ids" { value = module.vpc_use1["skylab"].private_subnets }
output "skylab-use1-public-subnet-ids" { value = module.vpc_use1["skylab"].public_subnets }
