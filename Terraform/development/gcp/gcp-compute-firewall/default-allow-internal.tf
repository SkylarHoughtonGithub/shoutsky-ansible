resource "google_compute_firewall" "default-allow-internal" {
  name          = "default-allow-internal"
  direction     = "INGRESS"
  network       = var.network_id
  priority      = 65534
  source_ranges = ["10.0.10.0/24"]
  target_tags   = ["default"]

  allow {
    ports    = ["0-65535"]
    protocol = "tcp"
  }
  allow {
    ports    = ["0-65535"]
    protocol = "udp"
  }
  allow {
    protocol = "icmp"
  }
}
