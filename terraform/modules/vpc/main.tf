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

resource "aws_security_group" "ci_sg" {
  name        = "ci-server-sg"
  description = "CI-Server; open for HTTP, MySQL, Jenkins, SSH"

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Jenkins"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
  }

  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
  }

resource "aws_instance" "ci_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  key_name               = var.key_name
  vpc_security_group_ids = [aws_security_group.ci_sg.id]

  tags = {
    Name = "CI-Server"
  }
}
}