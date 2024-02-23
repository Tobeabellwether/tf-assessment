resource "google_compute_instance" "instance" {
  count        = var.instance_count
  name         = "${var.instance_prefix}-${count.index}"
  machine_type = var.instance_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      auto_delete  = true
      image        = var.image
      disk_size_gb = var.instance_disk_size
    }
  }

  network_interface {
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
}
