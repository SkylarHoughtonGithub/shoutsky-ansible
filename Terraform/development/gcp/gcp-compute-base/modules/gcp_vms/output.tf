output "instance_ips" {
  value = [for instance in google_compute_instance.vm_instance : instance.network_interface[0].access_config[0].nat_ip]
}