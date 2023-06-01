resource "google_compute_instance" "vm_instance" {
  count        = length(var.vms)
  name         = keys(var.vms)[count.index]
  machine_type = var.vms[keys(var.vms)[count.index]].machine_type
  boot_disk {
    initialize_params {
      image = var.vms[keys(var.vms)[count.index]].image
      size  = var.vms[keys(var.vms)[count.index]].disk_size_gb
    }
  }
  network_interface {
    network    = var.vms[keys(var.vms)[count.index]].vpc
    subnetwork = var.vms[keys(var.vms)[count.index]].subnet
    access_config {}
  }
  metadata_startup_script = ""
  tags                    = var.vms[keys(var.vms)[count.index]].tags

  metadata = {
    ssh-keys = "skylarhoughton1996:${file("${path.module}/id_rsa.pub")}"
  }
}
