locals {
  config = yamldecode(file("${path.module}/values.yaml"))
}

module "eks" {
  source = "../../modules/eks"

  cluster_name       = local.config.cluster.name
  cluster_type       = local.config.cluster.type
  kubernetes_version = local.config.cluster.kubernetes_version

  endpoint_public_access  = local.config.cluster.endpoint.public_access
  endpoint_private_access = local.config.cluster.endpoint.private_access

  create_vpc         = local.config.network.create_vpc
  vpc_cidr           = local.config.network.vpc.cidr
  availability_zones = local.config.network.availability_zones
  private_subnets    = local.config.network.private_subnets
  public_subnets     = local.config.network.public_subnets

  create_cluster_role = local.config.iam.cluster.create
  create_node_role    = local.config.iam.node.create
  cluster_role_name   = local.config.iam.cluster.name
  node_role_name      = local.config.iam.node.name

  node_groups = local.config.node_groups
  addons      = local.config.addons
  tags        = local.config.tags
}
