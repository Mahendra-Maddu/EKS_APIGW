# main.tf

provider "aws" {
  region = var.aws_region
}

module "vpc" {
  source               = "../modules/vpc"
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "eks" {
  source       = "../modules/eks"
  cluster_name = var.cluster_name
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnet_ids
}

module "nlb" {
  source     = "../modules/nlb"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnet_ids
}

module "api_gateway" {
  source         = "../modules/api_gateway"
  vpc_link_id    = module.nlb.vpc_link_id
  nlb_dns_name   = module.nlb.nlb_dns_name
}

module "waf" {
  source              = "../modules/waf"
  api_gateway_stage_arn = module.api_gateway.stage_arn
}



