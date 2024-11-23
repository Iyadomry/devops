resource "google_container_cluster" "this" {
  name                = var.cluster_name
  location            = var.zone
  deletion_protection = var.deletion_protection

  release_channel {
    channel = var.release_channel
  }

  network    = var.network
  subnetwork = var.subnetwork

  ip_allocation_policy {
    cluster_ipv4_cidr_block = var.cluster_ipv4_cidr_block
  }

  binary_authorization {
    evaluation_mode = var.binary_authorization_mode
  }

  remove_default_node_pool = var.remove_default_node_pool

  addons_config {
    horizontal_pod_autoscaling {
      disabled = var.horizontal_pod_autoscaling_disabled
    }
    http_load_balancing {
      disabled = var.http_load_balancing_disabled
    }
    gce_persistent_disk_csi_driver_config {
      enabled = var.gce_persistent_disk_csi_driver_enabled
    }
  }

  node_pool {
    name             = var.node_pool_name
    initial_node_count = var.initial_node_count

    node_config {
      machine_type    = var.machine_type
      service_account = var.service_account
      disk_type       = var.disk_type
      disk_size_gb    = var.disk_size_gb
      image_type      = var.image_type
      metadata        = var.node_metadata
    }

    management {
      auto_upgrade = var.auto_upgrade
      auto_repair  = var.auto_repair
    }

    upgrade_settings {
      max_surge       = var.max_surge
      max_unavailable = var.max_unavailable
    }
  }

  security_posture_config {
    mode = var.security_posture_mode
  }

  logging_service    = var.logging_service
  monitoring_service = var.monitoring_service
}
