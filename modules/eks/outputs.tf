output "cluster_name" {
  value = aws_eks_cluster.this.name
}

output "cluster_endpoint" {
  value = aws_eks_cluster.this.endpoint
}

output "cluster_arn" {
  value = aws_eks_cluster.this.arn
}

output "vpc_id" {
  value = module.vpc[0].vpc_id
}

output "private_subnets" {
  value = module.vpc[0].private_subnets
}
