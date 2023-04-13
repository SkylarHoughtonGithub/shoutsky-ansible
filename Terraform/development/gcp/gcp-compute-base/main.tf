# Create a single Compute Engine instance
resource "google_compute_instance" "rocky9-base" {
  name                = var.instance_vars["name"]
  machine_type        = var.instance_vars["machine_type"]
  zone                = var.instance_vars["zone"]
  tags                = var.tags
  deletion_protection = false #Dev machine

  metadata_startup_script = file("${path.module}/files/gcp-compute-base.sh")
  boot_disk {
    initialize_params {
      image = var.image["rocky9_base"]
    }
  }

  network_interface {
    subnetwork = var.instance_vars["subnet_id"]

    access_config {
      # Include this section to give the VM an external IP address
    }

  }

  shielded_instance_config {
    enable_secure_boot          = true
    enable_vtpm                 = true
    enable_integrity_monitoring = true

  }
}
