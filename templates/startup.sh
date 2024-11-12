#!/bin/bash

#### Configure node ####

# Optionally enable Slack health check alerts
#yq eval '.health_checks.slack_alerts.webhook_secret_name = "${TF_SLACK_WEBHOOK_SECRET_NAME}"' -i /etc/flare/config.yaml
#yq eval '.health_checks.slack_alerts.enabled = true' -i /etc/flare/config.yaml

# Optionally enable Promtail to scrape logs and send it to Grafana Loki
#yq eval '.promtail.grafana_loki_endpoint = "${TF_GRAFANA_LOKI_ENDPOINT}"' -i /etc/flare/config.yaml
#yq eval '.promtail.enabled = true' -i /etc/flare/config.yaml

# Optionally enable node_exporter to expose metrics on port 9100.
# External Prometheus can be configured to scrape these metrics.
#yq eval '.node_exporter.host = "0.0.0.0"' -i /etc/flare/config.yaml
#yq eval '.node_exporter.enabled = true' -i /etc/flare/config.yaml

#### Start node ####

nodectl apply --target all
