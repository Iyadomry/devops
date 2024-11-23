output "cluster_name" {
  value = google_container_cluster.this.name
}

output "endpoint" {
  value = google_container_cluster.this.endpoint
}

output "node_pool_name" {
  value = google_container_cluster.this.node_pool[0].name
}
