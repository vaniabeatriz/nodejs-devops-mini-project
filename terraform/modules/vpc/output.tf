output "vpc_id" {
  value       = aws_vpc.core.id
  description = "ID of devops-mini-project VPC."
}

output "public_subnet_1_id" {
  value       = aws_subnet.public_1.id
  description = "ID of the 1st public subnet."
}

output "public_subnet_2_id" {
  value       = aws_subnet.public_2.id
  description = "ID of the 2nd public subnet."
}

output "public_subnet_ids" {
  value = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id
  ]

  description = "List of public subnet IDs."
}