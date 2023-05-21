variable "gcp_auth_file" {
  type        = string
  description = "GCP authentication file"
  default     = "~/.gcp/homelab-369103-c1e39fe9aa24.json"
}

variable "network_id" {
  default = "homelab-network"
}
