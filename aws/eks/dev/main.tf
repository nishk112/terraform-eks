resource "aws_iam_role" "eks_cluster_role" {
  name = "eks-cluster-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "eks.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy_attachment" "eks_cluster_policy" {
  role       = aws_iam_role.eks_cluster_role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}
module "eks" {
  source = "../../../modules/eks"

  cluster_name      = "demo-eks"
  cluster_role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_id = var.vpc_id

  subnet_ids = var.subnet_ids
}
#demo push