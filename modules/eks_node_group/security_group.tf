resource "aws_security_group" "node_sg" {
  name        = "eks-node-sg"
  description = "EKS worker node security group"
  vpc_id      = var.vpc_id

  # Allow traffic from ALB / Cluster
  ingress {
    description = "Allow app traffic from ALB"
    from_port   = 5000
    to_port     = 5000
    protocol    = "tcp"
    security_groups = [var.alb_sg_id] # IMPORTANT
  }

  # Node to node
  ingress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    self      = true
  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks-node-sg"
  }
}