resource "aws_security_group" "eks" {
  name        = "terraform-eks"
  description = "Cluster communication with worker nodes"
  vpc_id      = aws_vpc.eks.id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = [
      aws_subnet.a.cidr_block,
      aws_subnet.b.cidr_block,
      aws_subnet.c.cidr_block,
      var.vpn_cidr_block
    ]
  }
}