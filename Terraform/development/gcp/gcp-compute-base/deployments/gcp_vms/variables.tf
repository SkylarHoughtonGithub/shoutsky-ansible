variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
  default     = "~/.gcp/homelab-369103-25b92b6efc0d.json"
}

variable "vms" {
  description = "VM attribute map"
  type = map(object({
    machine_type = string
    disk_size_gb = number
    vpc          = string
    subnet       = string
    image        = string
    tags         = list(string)
  }))

  default = {
    "ansible-control" = {
      machine_type = "e2-medium"
      disk_size_gb = 20
      vpc          = "homelab-network"
      subnet       = "homelab-subnet"
      image        = "homelab-369103/gcp-rocky9-base"
      tags         = ["web", "ssh", "default"]
    }

    "ansible-node1" = {
      machine_type = "e2-small"
      disk_size_gb = 20
      vpc          = "homelab-network"
      subnet       = "homelab-subnet"
      image        = "homelab-369103/gcp-rocky9-base"
      tags         = ["web", "ssh", "default"]
    }

    "ansible-node2" = {
      machine_type = "e2-small"
      disk_size_gb = 20
      vpc          = "homelab-network"
      subnet       = "homelab-subnet"
      image        = "homelab-369103/gcp-rocky9-base"
      tags         = ["web", "ssh", "default"]
    }
  }
}
