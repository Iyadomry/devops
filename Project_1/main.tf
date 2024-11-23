provider "google" {
  project = var.project
  region  = var.region
}

module "gke" {
  source                     = "./modules/gke"
  cluster_name               = var.cluster_name
  zone                       = var.zone
  deletion_protection        = var.deletion_protection
  release_channel            = var.release_channel
  network                    = var.network
  subnetwork                 = var.subnetwork
  cluster_ipv4_cidr_block    = var.cluster_ipv4_cidr_block
  binary_authorization_mode  = var.binary_authorization_mode
  remove_default_node_pool   = var.remove_default_node_pool
  horizontal_pod_autoscaling_disabled = var.horizontal_pod_autoscaling_disabled
  http_load_balancing_disabled         = var.http_load_balancing_disabled
  gce_persistent_disk_csi_driver_enabled = var.gce_persistent_disk_csi_driver_enabled
  node_pool_name             = var.node_pool_name
  initial_node_count         = var.initial_node_count
  machine_type               = var.machine_type
  service_account            = var.service_account
  disk_type                  = var.disk_type
  disk_size_gb               = var.disk_size_gb
  image_type                 = var.image_type
  auto_upgrade               = var.auto_upgrade
  auto_repair                = var.auto_repair
  max_surge                  = var.max_surge
  max_unavailable            = var.max_unavailable
  security_posture_mode      = var.security_posture_mode
  logging_service            = var.logging_service
  monitoring_service         = var.monitoring_service
}

output "gke_endpoint" {
  value = module.gke.endpoint
}
