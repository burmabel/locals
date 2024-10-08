provider "aws" {
  region = "us-east-1"
}
locals {
  vpc_cidr_block     = "10.0.0.0/16"
  subnet_cidr_blocks = ["10.0.0.0/16", "10.0.0.0/16"]
  subnet_az          = ["us-east-1", "us-east-1b"]
}
resource "aws_vpc" "burma_vpc" {
  cidr_block = local.vpc_cidr_block
}
resource "aws_subnet" "subnets" {
  count             = length(local.subnet_cidr_blocks)
  vpc_id            = aws_vpc.burma_vpc.id
  cidr_block        = local.subnet_cidr_blocks[count.index]
  availability_zone = local.subnet_az[count.index]
}