data "aws_eks_cluster_auth" "main" {
  provider = aws.use1
  name     = module.eks-use1["skylab"].cluster_name
}
