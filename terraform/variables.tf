variable "aws_region" {
  description = "The AWS region to create resources in"
  default     = "eu-central-1"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  default     = "eks-cluster"
}

variable "vpc" {
  description = "List of subnet IDs for the EKS cluster"
  type        = string
  default     = "vpc-09305c0e6f4405f3e"
}

variable "subnets" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
  default     = ["subnet-02b535d84f8ef94fb", "subnet-0f3e375081ee0ba18"]
}

variable "control_plane_subnet_ids" {
  description = "List of subnet IDs for the EKS control plane"
  type        = list(string)
  default     = ["subnet-02b535d84f8ef94fb", "subnet-0f3e375081ee0ba18"]
}

variable "node_groups" {
  description = "Map of EKS Node Groups"
  type = map(any)
  default = {
    eks_nodes = {
      min_capacity     = 1
      max_capacity     = 2
      desired_capacity = 1
      instance_type    = "t2.micro"
    }
  }
}
