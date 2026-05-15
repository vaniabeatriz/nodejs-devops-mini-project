variable "devops_mini_project" {
  type    = string
  default = "nodejs-devops-mini-project"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  type    = string
  default = "10.0.0.0/23"
}

variable "public_subnet_2_cidr" {
  type    = string
  default = "10.0.2.0/23"
}

variable "az_1" {
  type    = string
  default = "eu-west-1a"
}

variable "az_2" {
  type    = string
  default = "eu-west-1b"
}
