output "vpc_arn" {
  description = "ARN of the VPC"
  value       = module.vpc.vpc_arn
}

output "security_group_name" {
  description = "Name of the security group"
  value       = aws_security_group.http_access.name
}
