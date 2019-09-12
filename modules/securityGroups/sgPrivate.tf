variable "networkVPC" {}
variable "tags" {}
resource "aws_security_group" "privateSG" {
 name        = "Private SG"
 description = "SSH, RDP & ICMP private access "
 vpc_id      = "${var.networkVPC}"
 tags        = "${var.tags}"

   ingress {
     from_port   = 22
     to_port     = 22
     protocol    = "TCP"
     cidr_blocks     = ["0.0.0.0/0"]
   }

   ingress {
     from_port   = 3389
     to_port     = 3389
     protocol    = "TCP"
     cidr_blocks     = ["0.0.0.0/0"]
   }

   ingress {
     from_port = -1
     to_port = -1
     protocol = "icmp"
     cidr_blocks     = ["0.0.0.0/0"]
   }

   egress {
     from_port       = 0
     to_port         = 0
     protocol        = "-1"
     cidr_blocks     = ["0.0.0.0/0"]
   }
}
