# gcloud auth application-default login
terraform {
  backend "gcs" {
    bucket = "shoutsky-state"
    prefix = "terraform/vm"
  }
}

provider "google" {
  project     = "homelab-369103"
  credentials = file(var.gcp_auth_file)
  region      = "us-central1"
  zone        = "us-central1-c"
}
