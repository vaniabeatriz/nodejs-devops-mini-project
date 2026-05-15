#PROVIDER
provider "aws" {
    region = var.aws_region
}

#VPC
resource "aws_vpc" "main" {
    cidr_block = var.vpc_cidr

    tags = {Name = "devops-mini-vpc"}
}

#


