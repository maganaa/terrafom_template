output "lumstonVPC" {
    value = "${aws_vpc.lumston.id}"
}
output "privateNet" {
  value="${aws_subnet.private.id}"
}
