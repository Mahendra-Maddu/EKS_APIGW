# variables.tf

variable "aws_region" {
  default = "us-east-2"
}

variable "vpc_cidr" {
  default = "10.0.0.0/16"
}

variable "availability_zones" {
  default = ["us-east-2a", "us-east-2b"]
}

variable "public_subnet_cidrs" {
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnet_cidrs" {
  default = ["10.0.3.0/24", "10.0.4.0/24"]
}

variable "cluster_name" {
  default = "mahi-eks-cluster"
}
