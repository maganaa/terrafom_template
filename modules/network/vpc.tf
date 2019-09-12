variable "vpcFullCidr" {}
variable "tags" {}

resource "aws_vpc" "lumston" {
     cidr_block           = "${var.vpcFullCidr}"
     tags                 = "${var.tags}"
}
