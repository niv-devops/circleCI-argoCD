terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.75.0"
    }
  }
  backend "s3" {
    bucket = "tasty-kfc-bucket"
    key    = "state/terraform.tfstate"
    region = "eu-central-1"
  }
  required_version = ">= 1.8.5"
}

provider "aws" {
  region = var.aws_region
}

module "eks" {
  source       = "github.com/terraform-aws-modules/terraform-aws-eks?ref=97a08c8aff5dbf51a86b4c8cd88a858336cd0208" # v20.29.0
  cluster_name = var.cluster_name
  cluster_endpoint_public_access = true
  enable_cluster_creator_admin_permissions = true

  vpc_id                   = var.vpc
  subnet_ids               = var.subnets
  control_plane_subnet_ids = var.control_plane_subnet_ids
  eks_managed_node_groups  = var.node_groups
}
