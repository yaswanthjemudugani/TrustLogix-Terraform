module "control_plane_vpc" {
  source   = "./modules/vpc"
  vpc_name = "control-plane-vpc"
  vpc_cidr = "10.0.0.0/16"
  az       = "ap-south-1a"
}

module "data_plane_vpc" {
  source   = "./modules/vpc"
  vpc_name = "data-plane-vpc"
  vpc_cidr = "192.168.0.0/16"
  az       = "ap-south-1b"
}
