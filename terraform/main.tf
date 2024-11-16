terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.75.0"
    }
  }
  required_version = ">= 1.8.5"
}

provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block
}

resource "aws_subnet" "subnet_a" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = var.az_a
  map_public_ip_on_launch = true
}

resource "aws_subnet" "subnet_b" {
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = var.az_b
  map_public_ip_on_launch = true
}

module "eks" {
  source       = "github.com/terraform-aws-modules/terraform-aws-eks?ref=97a08c8aff5dbf51a86b4c8cd88a858336cd0208" # v20.29.0
  cluster_name = var.cluster_name
  eks_managed_node_groups  = var.node_groups
  control_plane_subnet_ids = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
  subnet_ids   = [aws_subnet.subnet_a.id, aws_subnet.subnet_b.id]
}
