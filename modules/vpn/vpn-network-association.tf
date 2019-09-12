resource "aws_ec2_client_vpn_network_association" "vpnNetAssociation" {
  client_vpn_endpoint_id = "${var.vpnls}"
  subnet_id              = "${var.private}"
}
