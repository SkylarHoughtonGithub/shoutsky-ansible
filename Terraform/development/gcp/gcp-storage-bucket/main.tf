resource "google_storage_bucket" "tfstate" {
  name          = "shoutsky-state"
  force_destroy = false
  location      = "US"
  storage_class = "STANDARD"
  versioning {
    enabled = true
  }
}