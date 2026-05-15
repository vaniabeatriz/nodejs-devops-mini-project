variable "devops_mini_project" {
  type        = string
  description = "Project name used for resource naming."
  default     = "nodejs-devops-mini-project"
}

variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "public_subnet_1_cidr" {
  type        = string
  description = "CIDR for public subnet."
  default     = "10.0.0.0/23"
}

variable "public_subnet_2_cidr" {
  type        = string
  description = "CIDR block for the 2nd public subnet."
  default     = "10.0.2.0/23"
}

variable "az_1" {
  type        = string
  description = "Availability zone for the 1st public subnet."
  default     = "eu-west-1a"
}

variable "az_2" {
  type        = string
  description = "Availability zone for the 2nd public subnet."
  default     = "eu-west-1b"
}
