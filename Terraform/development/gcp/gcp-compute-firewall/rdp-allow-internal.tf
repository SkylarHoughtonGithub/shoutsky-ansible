resource "google_compute_firewall" "rdp-allow-internal" {
  name          = "rdp-allow-internal"
  direction     = "INGRESS"
  network       = var.network_id
  priority      = 65534
  source_ranges = ["10.0.10.0/24"]
  target_tags   = ["rdp"]

  allow {
    ports    = ["3389"]
    protocol = "tcp"
  }
}
