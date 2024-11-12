resource "google_service_account" "this" {
  account_id   = "flare-node-example"
  display_name = "Flare Node Example SA"
}

# Optionally give the service account permissions to access
# the Slack webhook stored in GCP Secret Manager.
# This webhook can then be used by the node to send notifications
# about the node's health.
#
# resource "google_secret_manager_secret_iam_member" "secret_member" {
#   project   = var.gcp_project_name
#   secret_id = "projects/${var.gcp_project_name}/secrets/${var.slack_webhook_secret_name}"
#   role      = "roles/secretmanager.secretAccessor"
#
#   member = "serviceAccount:${google_service_account.this.email}"
# }
