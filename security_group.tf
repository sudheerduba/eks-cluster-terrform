resource "aws_security_group" "default_group" {
  name        = var.vpc_cidr_block
  description = "Default security group for EKS VPC"
  vpc_id      = aws_vpc.eks_vpc.id
  depends_on = [
    aws_vpc.eks_vpc
  ]
}