output "vpc_id" {
  value = aws_vpc.TrustLogix.id
}

output "security_group_id" {
  value = aws_security_group.vpc_sg.id
}
