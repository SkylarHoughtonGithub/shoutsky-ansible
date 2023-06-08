resource "google_compute_firewall" "ftp-allow-all" {
  name          = "ftp-allow-all"
  direction     = "INGRESS"
  network       = var.network_id
  priority      = 900
  source_ranges = ["10.0.10.0/24"]
  target_tags   = ["default"]

  allow {
    protocol = "tcp"
    ports    = ["21"]
  }
}
