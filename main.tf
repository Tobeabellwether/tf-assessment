terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
    }
  }
}

provider "google" {
  credentials = file(var.gcp_credentials_path)
  project     = var.gcp_project
  region      = var.gcp_region
}
