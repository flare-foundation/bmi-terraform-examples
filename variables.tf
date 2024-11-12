variable "gcp_project_name" {
  type        = string
  description = "GCP project name"
}

variable "slack_webhook_secret_name" {
  type        = string
  description = "Name of the GCP Secret Manager secret containing a Slack webhook"
}
