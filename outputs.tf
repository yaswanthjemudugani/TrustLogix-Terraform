output "control_plane_vpc_id" {
  value = module.control_plane_vpc.vpc_id
}

output "data_plane_vpc_id" {
  value = module.data_plane_vpc.vpc_id
}

output "vpc_peering_id" {
  value = module.vpc_peering.vpc_peering_id
}
