# Make sure to update image fields to the latest available images:
# - Go to GCP marketplace
# - Find Blockchain Machine Images and click launch
# - Click on "COMMAND-LINE DEPLOYMENT" tab
# - Scroll down to "VM image" section and find the latest image

locals {
  # This will deploy two Flare node replicas,
  # one in EU and another in US
  replicas = {
    1 = {
      # Update to latest image here!!!
      image = "projects/mpi-flare-public/global/images/flare---v1-7-1807---v0-3-1---date-2024-11-04"
      zone  = "europe-west1-c"
    },
    2 = {
      # Update to latest image here!!!
      image = "projects/mpi-flare-public/global/images/flare---v1-7-1807---v0-3-1---date-2024-11-04"
      zone  = "us-west1-a"
    }
  }
}

resource "google_compute_instance" "this" {
  for_each = local.replicas

  project = var.gcp_project_name
  name    = "flare-node-example-replica-${each.key}"
  zone    = each.value.zone

  machine_type = "n2d-standard-4"

  metadata = {
    startup-script = templatefile("${path.module}/templates/startup.sh", {
      # Required only if alerting to Slack is enabled in startup.sh.
      TF_SLACK_WEBHOOK_SECRET_NAME = var.slack_webhook_secret_name
      # Required only if Promtail is enabled in startup.sh.
      # Example: "http://<set_internal_domain_here>/loki/api/v1/push"
      TF_GRAFANA_LOKI_ENDPOINT = ""
    })
    shutdown-script = templatefile("${path.module}/templates/shutdown.sh", {})
  }


  boot_disk {
    initialize_params {
      image = each.value.image
      type  = "pd-balanced"
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral public IP
    }
  }

  tags = google_compute_firewall.peering.target_tags

  service_account {
    email  = google_service_account.this.email
    scopes = ["cloud-platform"]
  }
}
