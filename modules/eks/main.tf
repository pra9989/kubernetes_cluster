resource "aws_eks_cluster" "this" {
  name    = var.cluster_name
  version = var.kubernetes_version

  role_arn = aws_iam_role.cluster[0].arn

  access_config {
    authentication_mode = "API_AND_CONFIG_MAP"
  }

  vpc_config {
    subnet_ids = module.vpc[0].private_subnets

    endpoint_public_access  = var.endpoint_public_access
    endpoint_private_access = var.endpoint_private_access
  }

  tags = var.tags

  depends_on = [
    aws_iam_role_policy_attachment.cluster_policy
  ]
}
