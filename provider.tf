terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

# Provider configuration for resources within the project
provider "google" {
  alias   = "project"
  region  = var.region
  project = local.project_id
}
