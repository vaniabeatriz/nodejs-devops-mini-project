data "aws_subnet" "selected" {
  id = var.subnet_id
}

resource "aws_security_group" "deploy_sg" {
  name        = "${var.project_name}-sg"
  description = "Deployment server security group for HTTP, MySQL, and SSH."
  vpc_id      = data.aws_subnet.selected.vpc_id

  ingress {
    description = "Public HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Public MySQL"
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH from control plane"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.control_plane_cidr]
  }

  ingress {
    description = "SSH from CI server"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.ci_server_cidr]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}

resource "aws_instance" "deploy_server" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.deploy_sg.id]
  key_name               = var.key_name
  associate_public_ip_address = true

  tags = {
    Name = var.project_name
  }
}
