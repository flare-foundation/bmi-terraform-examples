# The port through which the network peers will connect to this node externally.
resource "google_compute_firewall" "peering" {
  project = var.gcp_project_name
  name    = "flare-example-peering-tcp"
  network = "default"

  allow {
    protocol = "tcp"
    ports    = ["9651"]
  }

  source_ranges = ["0.0.0.0/0"]
  target_tags   = ["flare-example-peering"]
  priority      = "600"
}
