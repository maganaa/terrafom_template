variable "arnCert"  {}
variable "tags" {}
variable "vpnls" {}
variable "private" {}
variable "vpnIP" {}

resource "aws_ec2_client_vpn_endpoint" "vpnls" {
  description             = "clientVPN"
  server_certificate_arn  = "${var.arnCert}"
  client_cidr_block       = "${var.vpnIP}"
  tags                    = "${var.tags}"
  authentication_options {
    type                       = "certificate-authentication"
    root_certificate_chain_arn = "${var.arnCert}"
  }
  connection_log_options {
   enabled               = true
   cloudwatch_log_group  = "${var.vpnls}"
 }

}
