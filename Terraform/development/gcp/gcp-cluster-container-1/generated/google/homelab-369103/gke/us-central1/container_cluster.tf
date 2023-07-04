resource "google_container_cluster" "potd-cluster" {
  addons_config {
    horizontal_pod_autoscaling {
      disabled = "false"
    }

    http_load_balancing {
      disabled = "false"
    }

    network_policy_config {
      disabled = "true"
    }
  }

  cluster_autoscaling {
    enabled = "false"
  }

  cluster_ipv4_cidr = "10.16.0.0/14"

  database_encryption {
    state = "DECRYPTED"
  }

  default_max_pods_per_node   = "110"
  enable_autopilot            = "false"
  enable_binary_authorization = "false"
  enable_intranode_visibility = "false"
  enable_kubernetes_alpha     = "false"
  enable_legacy_abac          = "false"
  enable_shielded_nodes       = "false"
  enable_tpu                  = "false"
  initial_node_count          = "0"

  ip_allocation_policy {
    cluster_ipv4_cidr_block  = "10.16.0.0/14"
    services_ipv4_cidr_block = "10.20.0.0/20"
  }

  location = "us-central1-a"

  logging_config {
    enable_components = ["SYSTEM_COMPONENTS", "WORKLOADS"]
  }

  logging_service = "logging.googleapis.com/kubernetes"

  master_auth {
    client_certificate_config {
      issue_client_certificate = "false"
    }
  }

  monitoring_config {
    enable_components = ["SYSTEM_COMPONENTS"]
  }

  monitoring_service = "monitoring.googleapis.com/kubernetes"
  name               = "potd-cluster"
  network            = "projects/homelab-369103/global/networks/default"

  network_policy {
    enabled  = "false"
    provider = "PROVIDER_UNSPECIFIED"
  }

  networking_mode = "VPC_NATIVE"
  node_version    = "1.25.8-gke.1000"

  private_cluster_config {
    enable_private_endpoint = "false"
    enable_private_nodes    = "false"

    master_global_access_config {
      enabled = "false"
    }
  }

  project = "homelab-369103"

  release_channel {
    channel = "REGULAR"
  }

  subnetwork = "projects/homelab-369103/regions/us-central1/subnetworks/default"
}
