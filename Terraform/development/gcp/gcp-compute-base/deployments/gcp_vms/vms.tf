module "gcp_vms" {
  source = "../../modules/gcp_vms"
  vms    = var.vms
}
