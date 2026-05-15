variable "aws_region" {
  type    = string
  default = "eu-west-1"
}

variable "project_name" {
  type    = string
  default = "deployment-server"
}

variable "ami_id" {
  type = string
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type = string
}

variable "subnet_id" {
  type = string
}

variable "control_plane_cidr" {
  type        = string
  description = "CIDR block for SSH access from the control plane."
  default     = "0.0.0.0/0"
}

variable "ci_server_cidr" {
  type        = string
  description = "CIDR block for SSH access from the CI server."
  default     = "0.0.0.0/0"
}
