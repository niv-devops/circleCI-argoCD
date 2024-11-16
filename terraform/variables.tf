variable "aws_region" {
  description = "The AWS region to create resources in"
  default     = "eu-central-1"
}

variable "cluster_name" {
  description = "The name of the EKS cluster"
  default     = "eks-cluster"
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

variable "subnets" {
  description = "List of subnet IDs for the EKS cluster"
  type        = list(string)
  default     = ["subnet-02b535d84f8ef94fb", "subnet-02b535d84f8ef94fb"]
}
