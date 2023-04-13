resource "google_compute_network" "network" {
  name                    = var.network_vars["name"]
  auto_create_subnetworks = false
  mtu                     = var.network_vars["mtu"]
}

resource "google_compute_subnetwork" "subnet" {
  name          = var.subnet_vars["name"]
  ip_cidr_range = var.subnet_vars["cidr"]
  region        = var.subnet_vars["region"]
  network       = google_compute_network.network.id
}