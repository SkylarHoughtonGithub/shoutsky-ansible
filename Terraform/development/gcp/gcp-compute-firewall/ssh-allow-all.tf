resource "google_compute_firewall" "ssh-allow-all" {
  name          = "ssh-allow-all"
  direction     = "INGRESS"
  network       = var.network_id
  priority      = 1000
  source_ranges = ["0.0.0.0/0"] #TODO: Convert to 35.235.240.0/20 for GCP CIDR and my IP 
  target_tags   = ["ssh"]

  allow {
    ports    = ["22"]
    protocol = "tcp"
  }
}
