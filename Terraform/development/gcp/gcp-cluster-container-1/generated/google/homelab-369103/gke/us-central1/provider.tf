provider "google" {
  project = "homelab-369103"
}

terraform {
	required_providers {
		google = {
	    version = "~> 4.0.0"
		}
  }
}
