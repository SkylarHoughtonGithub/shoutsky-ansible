resource "google_project_iam_binding" "compute_admin" {
  project = "homelab-369103"
  role    = "roles/compute.admin"

  members = [
    "serviceAccount:shoutsky@homelab-369103.iam.gserviceaccount.com",
  ]
}

resource "google_project_iam_binding" "storage_admin" {
  project = "homelab-369103"
  role    = "roles/storage.admin"

  members = [
    "serviceAccount:shoutsky@homelab-369103.iam.gserviceaccount.com",
  ]
}

resource "google_project_iam_binding" "iam_admin" {
  project = "homelab-369103"
  role    = "roles/iam.roleAdmin"

  members = [
    "serviceAccount:shoutsky@homelab-369103.iam.gserviceaccount.com",
  ]
}

resource "google_project_iam_binding" "iap_admin" {
  project = "homelab-369103"
  role    = "roles/iap.admin"

  members = [
    "serviceAccount:shoutsky@homelab-369103.iam.gserviceaccount.com",
  ]
}
