provider "aws" {
	region = "eu-west-2"
}

# Create VPC

resource "aws_vpc" "main_vpc" {
	cidr_block	= "10.0.0.0/16"
	tags = {
		Name = "main_vpc"
	}
}

#Public subnet 1
resource "aws_subnet" "main_subnet1" {
	cidr_block 	= "10.0.1.0/23"
	tags = {
		Name = "main_subnet1"
	}
}

#Public subnet 2
resource "aws_subnet" "main_subnet2" {
        cidr_block      = "10.0.3.0/23"
        tags = {
                Name = "main_subnet2"
        }
}

