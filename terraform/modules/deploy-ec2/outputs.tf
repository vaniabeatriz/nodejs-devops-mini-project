output "deploy_instance_id" {
  value       = aws_instance.deploy_server.id
  description = "ID of the deployment EC2 instance."
}

output "deploy_public_ip" {
  value       = aws_instance.deploy_server.public_ip
  description = "Public IP address of the deployment EC2 instance."
}

output "deploy_security_group_id" {
  value       = aws_security_group.deploy_sg.id
  description = "Security group ID for the deployment EC2 instance."
}
