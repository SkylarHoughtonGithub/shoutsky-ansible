data "terraform_remote_state" "networks" {
  backend = "local"

  config = {
    path = "../../../../../generated/google/homelab-369103/networks/us-central1/terraform.tfstate"
  }
}

data "terraform_remote_state" "subnetworks" {
  backend = "local"

  config = {
    path = "../../../../../generated/google/homelab-369103/subnetworks/us-central1/terraform.tfstate"
  }
}
