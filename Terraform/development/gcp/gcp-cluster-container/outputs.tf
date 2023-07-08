output "google_container_cluster_potd-cluster_self_link" {
  value = google_container_cluster.potd-cluster.self_link
}

output "google_container_node_pool_potd-cluster_default-pool_id" {
  value = google_container_node_pool.potd-cluster_default-pool.id
}
