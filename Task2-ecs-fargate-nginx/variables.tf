variable "app_name" {
  default = "nginx-fargate"
}

variable "vpc_cidr" {
  default = "10.100.0.0/16"
}

variable "public_subnets" {
  default = ["10.100.1.0/24", "10.100.2.0/24"]
}

variable "availability_zones" {
  default = ["ap-south-1a", "ap-south-1b"]
}

variable "container_port" {
  default = 80
}
