variable "tags" {}
resource "aws_cloudwatch_log_group" "logEndPoint" {
  name = "logEndPoint"
  tags = "${var.tags}"
}
