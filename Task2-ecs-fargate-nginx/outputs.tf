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

# Public IP of ECS Fargate Task
data "aws_ecs_tasks" "nginx_tasks" {
  cluster = aws_ecs_cluster.main.id
  service_name = aws_ecs_service.nginx_service.name
}

data "aws_ecs_task" "nginx_task_detail" {
  task_arn = data.aws_ecs_tasks.nginx_tasks.arns[0]
}

data "aws_network_interface" "task_eni" {
  id = data.aws_ecs_task.nginx_task_detail.attachments[0].details[0].value
}

output "ecs_task_public_ip" {
  value       = data.aws_network_interface.task_eni.association[0].public_ip
}
