resource "aws_security_group" "black-salt" {
	name = "${var.environ}black-salt"
	ingress {
		from_port = local.fromport
		to_port = local.toport
		protocol = local.proto
		cidr_blocks = local.cidr
	}
}
