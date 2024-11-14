provider "google" {
  project = var.project_name
  region  = var.region
}

locals {
  services = [
    "compute.googleapis.com",
  ]
}

resource "google_project_service" "project_services" {
  for_each = toset(local.services)

  project = var.project_name
  service = each.value

  disable_dependent_services = true
  disable_on_destroy         = true
}
