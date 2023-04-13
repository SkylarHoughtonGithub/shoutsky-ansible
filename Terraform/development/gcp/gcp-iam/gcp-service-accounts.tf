#TODO: Assign role to service account
resource "google_service_account" "service_account" {
  account_id   = "shoutsky"
  display_name = "shoutsky service account"
}
