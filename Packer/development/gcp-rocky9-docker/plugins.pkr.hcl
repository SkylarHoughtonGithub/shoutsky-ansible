packer {
  required_plugins {
    googlecompute = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/googlecompute"
    }

    ansible = {
      source  = "github.com/hashicorp/ansible"
      version = ">=1.0.2"
    }
  }
}
