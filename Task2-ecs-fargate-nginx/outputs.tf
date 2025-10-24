output "ecs_cluster_name" {
  value = aws_ecs_cluster.main.name
}

output "ecs_service_name" {
  value = aws_ecs_service.nginx_service.name
}

output "ecs_task_definition" {
  value = aws_ecs_task_definition.nginx_task.arn
}

output "public_subnet_ids" {
  value = aws_subnet.public[*].id
}

output "ecs_security_group_id" {
  value = aws_security_group.ecs_sg.id
}

output "note_task_public_ip" {
  value = "Check ECS Console → Cluster → Service → Task → Public IP"
}
