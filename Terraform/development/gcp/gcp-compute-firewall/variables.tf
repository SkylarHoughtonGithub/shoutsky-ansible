# GCP authentication file

variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
  default     = "~/.gcp/homelab-369103-1c2ee9cdd6be.json"
}

variable "network_id" {
  default = "homelab-network"
}
