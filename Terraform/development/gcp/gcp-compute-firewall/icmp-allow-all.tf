resource "google_compute_firewall" "icmp-allow-all" {
  name          = "icmp-allow-all"
  direction     = "INGRESS"
  network       = var.network_id
  priority      = 900
  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["default"]

  allow {
    protocol = "icmp"
  }
}
