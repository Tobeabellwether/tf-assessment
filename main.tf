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
  zone        = var.gcp_zone
}

module "compute_instances" {
  source              = "./modules/compute"
  gcp_zone            = var.gcp_zone
  user_name           = var.user_name
  public_ssh_key_path = var.public_ssh_key_path
  instance_count      = var.instance_count
  instance_prefix     = var.instance_prefix
  instance_type       = var.instance_type
  instance_image      = var.instance_image
  instance_disk_size  = var.instance_disk_size
}

output "instance_root_passwords" {
  value     = module.compute_instances.instance_root_passwords
  sensitive = true
}

output "ping_output" {
  value = module.compute_instances.ping_output
}