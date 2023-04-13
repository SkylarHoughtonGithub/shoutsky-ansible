# GCP authentication file
variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
  default     = "~/.gcp/homelab-369103-1c2ee9cdd6be.json"
}

variable "tags" {
  default = ["web", "ssh", "default"]
}


variable "image" {
  type = map(string)
  default = {
    cos97lts      = "cos-cloud/cos-97-lts"
    rocky8        = "rocky-linux-cloud/rocky-linux-8-optimized-gcp"
    rocky9_base   = "homelab-369103/gcp-rocky9-base"
    rocky9_docker = "homelab-369103/gcp-rocky9-docker"
    centos7       = "centos-cloud/centos-7"
    debian11      = "debian-cloud/debian-11"
    winserver2019 = "windows-cloud/windows-2019"
  }
}

variable "instance_vars" {
  type = map(string)
  default = {
    name         = "rocky9-docker1"
    machine_type = "e2-small"
    subnet_id : "homelab-subnet"
    zone = "us-central1-c"
  }
}