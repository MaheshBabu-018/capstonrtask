resource "aws_vpc" "frontend_vpc" {
  cidr_block           = var.vpc1_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = { Name = "frontend-vpc" }
}

resource "aws_vpc" "backend_vpc" {
  cidr_block           = var.vpc2_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = { Name = "backend-vpc" }
}
