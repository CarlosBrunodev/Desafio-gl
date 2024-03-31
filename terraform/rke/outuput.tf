output "kubeconfig" {
  description = "Virtual Machine name IP Address"
  value       = rke_cluster.foo2.kube_config_yaml
  sensitive   = true
}
