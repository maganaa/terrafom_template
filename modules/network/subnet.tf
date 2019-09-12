variable "availabilityZone" {}
variable "subnetPrivate" {}

resource "aws_subnet" "private" {
  vpc_id            = "${aws_vpc.lumston.id}"
  cidr_block        = "${var.subnetPrivate}"
  availability_zone = "${var.availabilityZone}"
  tags              = "${var.tags}"
}
