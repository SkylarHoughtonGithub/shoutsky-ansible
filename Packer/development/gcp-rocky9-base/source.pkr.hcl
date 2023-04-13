source "googlecompute" "gcp-rocky9-base" {
  image_name           = var.name
  project_id           = var.project_id
  source_image         = var.source_image
  ssh_username         = var.ssh_username
  ssh_private_key_file = var.ssh_private_key_file
  zone                 = var.gcp_zone
  subnetwork           = var.subnetwork
  machine_type         = var.machine_type
  tags                 = var.tags
}