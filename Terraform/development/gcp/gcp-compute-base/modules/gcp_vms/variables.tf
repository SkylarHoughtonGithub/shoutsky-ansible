variable "vms" {
  description = "VM attribute map"
  type = map(object({
    machine_type = string
    disk_size_gb = number
    image        = string
    tags         = list(string)
    vpc          = string
    subnet       = string
  }))
}