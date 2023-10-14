terraform {
  backend "s3" {
    bucket         = "skylab-platform-artifacts"
    region         = "us-east-2"
    key            = "tfstate/eks/boostrap/terraform.tfstate"
    encrypt        = true
    dynamodb_table = "LockID"
  }
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "kubernetes" {
  host                   = module.eks-use1["skylab"].cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks-use1["skylab"].cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.main.token
}

provider "aws" {
  alias  = "use1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "use2"
  region = "us-east-2"
}
