variable "devops_mini_project" {
  type    = string
  default = "devops-mini-project"
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

variable "vpc_id" {
  type = string
}

variable "control_plane_cidr" {
  type        = string
  description = "CIDR block for SSH access from the control plane."
  default     = "0.0.0.0/0"
}

