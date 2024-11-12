data "google_compute_network" "default" {
  project = var.gcp_project_name
  name    = "default"
}
