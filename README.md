# Blockchain Machine Images (BMI) Terraform Examples

This repository provides a simple example of deploying Blockchain Machine Images (BMI) using Terraform.
It demonstrates how to deploy two Flare replicas across EU and US regions.

## How to Use:

### Configure:

- Open [terraform.tfvars](terraform.tfvars) and set the variables
- Open [instance.tf](terraform.tfvars) and set the latest images as instructed
- Review the rest of the files and optionally enable features such as Slack alerting, Promtail logs scraping, exporting
  metrics, etc.

### Deploy:

```bash
terraform init
```

```bash
terraform apply
```

