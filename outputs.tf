output "control_plane_vpc_id" {
  value = module.control_plane_vpc.vpc_id
}

output "control_plane_sg_id" {
  value = module.control_plane_vpc.security_group_id
}

output "data_plane_vpc_id" {
  value = module.data_plane_vpc.vpc_id
}

output "data_plane_sg_id" {
  value = module.data_plane_vpc.security_group_id
}
