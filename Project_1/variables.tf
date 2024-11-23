variable "project" {
  description = "The GCP project ID."
  type        = string
}

variable "region" {
  description = "The GCP region."
  type        = string
}

variable "cluster_name" {
  type        = string
  description = "Name of the GKE cluster."
}

variable "zone" {
  type        = string
  description = "Zone where the GKE cluster will be deployed."
}

variable "deletion_protection" {
  type        = bool
  description = "Enable or disable deletion protection."
  default     = false
}

variable "release_channel" {
  type        = string
  description = "Release channel for GKE."
}

variable "network" {
  type        = string
  description = "VPC network to attach to the GKE cluster."
}

variable "subnetwork" {
  type        = string
  description = "Subnetwork to attach to the GKE cluster."
}

variable "cluster_ipv4_cidr_block" {
  type        = string
  description = "CIDR block for cluster IP allocation."
}

variable "binary_authorization_mode" {
  type        = string
  description = "Mode for binary authorization."
  default     = "DISABLED"
}

variable "remove_default_node_pool" {
  type        = bool
  description = "Remove the default node pool."
  default     = true
}

variable "horizontal_pod_autoscaling_disabled" {
  type        = bool
  description = "Disable horizontal pod autoscaling."
  default     = false
}

variable "http_load_balancing_disabled" {
  type        = bool
  description = "Disable HTTP load balancing."
  default     = false
}

variable "gce_persistent_disk_csi_driver_enabled" {
  type        = bool
  description = "Enable GCE persistent disk CSI driver."
  default     = true
}

variable "node_pool_name" {
  type        = string
  description = "Name of the node pool."
}

variable "initial_node_count" {
  type        = number
  description = "Initial number of nodes in the node pool."
}

variable "machine_type" {
  type        = string
  description = "Machine type for nodes in the pool."
}

variable "service_account" {
  type        = string
  description = "Service account for nodes in the pool."
}

variable "disk_type" {
  type        = string
  description = "Disk type for nodes."
  default     = "pd-balanced"
}

variable "disk_size_gb" {
  type        = number
  description = "Disk size in GB."
  default     = 50
}

variable "image_type" {
  type        = string
  description = "Image type for nodes."
}

variable "node_metadata" {
  type        = map(string)
  description = "Metadata for nodes."
  default     = {
    disable-legacy-endpoints = "true"
  }
}

variable "auto_upgrade" {
  type        = bool
  description = "Enable auto-upgrade for nodes."
}

variable "auto_repair" {
  type        = bool
  description = "Enable auto-repair for nodes."
}

variable "max_surge" {
  type        = number
  description = "Maximum surge during upgrades."
}

variable "max_unavailable" {
  type        = number
  description = "Maximum unavailable nodes during upgrades."
}

variable "security_posture_mode" {
  type        = string
  description = "Security posture mode."
  default     = "BASIC"
}

variable "logging_service" {
  type        = string
  description = "Logging service configuration."
}

variable "monitoring_service" {
  type        = string
  description = "Monitoring service configuration."
}
