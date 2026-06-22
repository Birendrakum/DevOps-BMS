# --- Outputs ---
output "cluster_endpoint" {
  value = aws_eks_cluster.my_cluster.endpoint
}

output "cluster_name" {
  value = aws_eks_cluster.my_cluster.name
}

output "vpc_id" {
  value = module.vpc.vpc_id
}
