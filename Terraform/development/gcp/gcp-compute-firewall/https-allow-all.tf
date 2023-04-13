resource "google_compute_firewall" "https-allow-all" {
  name          = "https-allow-all"
  direction     = "INGRESS"
  network       = var.network_id
  priority      = 1100
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web"]

  allow {
    protocol = "tcp"
    ports    = ["443"]
  }
}
