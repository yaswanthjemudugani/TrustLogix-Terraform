module "control_plane_vpc" {
  source   = "./modules/vpc"
  vpc_name = "control-plane-vpc"
  vpc_cidr = "10.0.0.0/16"
  az       = "ap-south-1a"
  admin_ip = "103.52.38.125/32"
}

module "data_plane_vpc" {
  source   = "./modules/vpc"
  vpc_name = "data-plane-vpc"
  vpc_cidr = "192.168.0.0/16"
  az       = "ap-south-1b"
  admin_ip = "103.52.38.125/32"
}

module "vpc_peering" {
  source            = "./modules/vpc-peering"
  vpc_id_cp         = module.control_plane_vpc.vpc_id
  vpc_id_dp         = module.data_plane_vpc.vpc_id
  route_table_id_cp = module.control_plane_vpc.public_route_table_id
  route_table_id_dp = module.data_plane_vpc.public_route_table_id
  vpc_cidr_cp       = "10.0.0.0/16"
  vpc_cidr_dp       = "192.168.0.0/16"
}
