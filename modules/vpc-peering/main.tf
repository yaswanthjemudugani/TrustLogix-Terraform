resource "aws_vpc_peering_connection" "cp_dp_peering" {
  vpc_id      = var.vpc_id_cp
  peer_vpc_id = var.vpc_id_dp
  auto_accept = true

  tags = { Name = "cp-dp-vpc-peering" }
}

resource "aws_route" "cp_to_dp_route" {
  route_table_id            = var.route_table_id_cp
  destination_cidr_block    = var.vpc_cidr_dp
  vpc_peering_connection_id = aws_vpc_peering_connection.cp_dp_peering.id
}

resource "aws_route" "dp_to_cp_route" {
  route_table_id            = var.route_table_id_dp
  destination_cidr_block    = var.vpc_cidr_cp
  vpc_peering_connection_id = aws_vpc_peering_connection.cp_dp_peering.id
}
