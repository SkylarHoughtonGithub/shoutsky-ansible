build {
  provisioner "ansible" {
    playbook_file = "../../../ansible/development/playbooks/docker.yml"
  }

  sources = ["sources.googlecompute.gcp-rocky9-docker"]
}
