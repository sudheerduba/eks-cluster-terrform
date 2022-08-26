resource "aws_security_group_rule" "ssh_rule" {
  type              = "ingress"
  from_port         = 0
  to_port           = 22
  protocol          = "TCP"
  cidr_blocks       = [aws_vpc.eks_vpc.cidr_block]
  security_group_id = aws_security_group.default_group.id
}

resource "aws_security_group_rule" "webapp_rule" {
  type              = "ingress"
  from_port         = 0
  to_port           = 80
  protocol          = "TCP"
  cidr_blocks       = [aws_vpc.eks_vpc.cidr_block]
  security_group_id = aws_security_group.default_group.id
}

resource "aws_security_group_rule" "default_egress_rule" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.default_group.id
}