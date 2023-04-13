resource "google_compute_firewall" "flask-allow-all" {
  name          = "flask-allow-all"
  direction     = "INGRESS"
  network       = var.network_id
  priority      = 1100
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["web"]

  allow {
    protocol = "tcp"
    ports    = ["5000"]
  }
}
