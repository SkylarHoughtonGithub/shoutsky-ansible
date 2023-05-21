resource "google_compute_instance" "vm_instance" {
    count = length(var.vms)
    name = keys(var.vms)[count.index]
    machine_type = var.vms[keys(var.vms)[count.index]].machine_type
    boot_disk {
        initialize_params {
            image = var.vms[keys(var.vms)[count.index]].image
            size = var.vms[keys(var.vms)[count.index]].disk_size_gb
        }
    }
    network_interface {
        network = "default"
        access_config {}
    }
    metadata_startup_script = ""
    tags = var.vms[keys(var.vms)[count.index]].tags

    # provisioner "ansible" {
    #     playbook_file = "${path.module}/files/playbooks/${var.vms[keys(var.vms)[count.index.role]]}.yml"
    #     inventory = self.network_interface[0].access_config[0].nat_ip
    #     extra_vars = {
    #         instance_name = self.name
    #     }
    }
}