# Provider-specific variables
project = "home-lab-440617"
region  = "us-central1"

# Module-specific variables
cluster_name               = "my-gke"
zone                       = "us-central1-a"
deletion_protection        = false
release_channel            = "REGULAR"
network                    = "projects/home-lab-440617/global/networks/default"
subnetwork                 = "projects/home-lab-440617/regions/us-central1/subnetworks/default"
cluster_ipv4_cidr_block    = "/17"
binary_authorization_mode  = "DISABLED"
remove_default_node_pool   = false
horizontal_pod_autoscaling_disabled = false
http_load_balancing_disabled         = false
gce_persistent_disk_csi_driver_enabled = true
node_pool_name             = "default-pool"
initial_node_count         = 3
machine_type               = "e2-medium"
service_account            = "home-svc-gcp@home-lab-440617.iam.gserviceaccount.com"
disk_type                  = "pd-balanced"
disk_size_gb               = 50
image_type                 = "COS_CONTAINERD"
auto_upgrade               = true
auto_repair                = true
max_surge                  = 1
max_unavailable            = 0
security_posture_mode      = "BASIC"
logging_service            = "logging.googleapis.com/kubernetes"
monitoring_service         = "monitoring.googleapis.com/kubernetes"
