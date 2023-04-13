variables {
  name                 = "gcp-rocky9-base"
  gcp_zone             = "us-central1-c"
  disk_size            = 20
  project_id           = "homelab-369103"
  source_image         = "rocky-linux-9-optimized-gcp-v20230306"
  ssh_username         = "shoutsky"
  machine_type         = "e2-small"
  ssh_private_key_file = "~/.ssh/gcp-ansible"
  subnetwork           = "homelab-subnet"
  tags                 = ["ssh"]
}