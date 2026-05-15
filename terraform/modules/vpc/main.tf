variable "devops_mini_project" {
  type = string
}

resource "aws_vpc" "core" {
  cidr_block           = var.vpc_cidr
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "${var.devops_mini_project}-vpc"
  }
}

resource "aws_internet_gateway" "public" {
  vpc_id = aws_vpc.core.id

  tags = {
    Name = "${var.devops_mini_project}-igw"
  }
}

resource "aws_subnet" "public_1" {
  vpc_id                  = aws_vpc.core.id
  cidr_block              = var.public_subnet_1_cidr
  availability_zone       = var.az_1
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.devops_mini_project}-public-1"
  }
}

resource "aws_subnet" "public_2" {
  vpc_id                  = aws_vpc.core.id
  cidr_block              = var.public_subnet_2_cidr
  availability_zone       = var.az_2
  map_public_ip_on_launch = true

  tags = {
    Name = "${var.devops_mini_project}-public-2"
  }
}
