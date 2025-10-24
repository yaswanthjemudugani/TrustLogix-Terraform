# ECS Cluster Name
output "ecs_cluster_name" {
  value       = aws_ecs_cluster.main.name
}

# ECS Service Name
output "ecs_service_name" {
  value       = aws_ecs_service.nginx_service.name
}

# ECS Task Definition ARN
output "ecs_task_definition" {
  value       = aws_ecs_task_definition.nginx_task.arn
}

# Public Subnet IDs
output "public_subnet_ids" {
  value       = aws_subnet.public[*].id
}

# ECS Security Group ID
output "ecs_security_group_id" {
  value       = aws_security_group.ecs_sg.id
}

# Info: Fargate public IP
output "note_task_public_ip" {
  value       = "Check ECS Console → Cluster → Service → Task → Public IP"
}
