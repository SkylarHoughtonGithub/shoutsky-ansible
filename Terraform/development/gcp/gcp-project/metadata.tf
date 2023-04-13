resource "google_compute_project_metadata" "default_ssh_keys" {
  metadata = {
    ssh-keys = file("${path.module}/files/keys/gcp-ansible.pub")
  }
}