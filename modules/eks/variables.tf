variable "cluster_name" { type = string }
variable "cluster_type" { type = string }
variable "kubernetes_version" { type = string }

variable "endpoint_public_access" { type = bool }
variable "endpoint_private_access" { type = bool }

variable "create_vpc" { type = bool }
variable "vpc_cidr" { type = string }
variable "availability_zones" { type = list(string) }
variable "private_subnets" { type = list(string) }
variable "public_subnets" { type = list(string) }

variable "create_cluster_role" { type = bool }
variable "create_node_role" { type = bool }
variable "cluster_role_name" { type = string }
variable "node_role_name" { type = string }

variable "node_groups" { type = any }
variable "addons" { type = any }

variable "tags" {
  type    = map(string)
  default = {}
}
