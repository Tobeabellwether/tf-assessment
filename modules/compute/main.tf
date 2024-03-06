resource "google_compute_instance" "instance" {
  count        = var.instance_count
  name         = "${var.instance_prefix}-${count.index}"
  machine_type = var.instance_type
  zone         = var.gcp_zone

  metadata = {
    ssh-keys       = "${var.user_name}:${file(var.public_ssh_key_path)}"
    startup-script = <<-EOT
      #!/bin/bash
      echo root:${random_password.root_password[count.index].result} | chpasswd
    EOT
  }

  boot_disk {
    auto_delete = true
    initialize_params {
      image = var.instance_image
      size  = var.instance_disk_size
    }
  }

  network_interface {
    // All use the default VPC network
    // Internal ICMP is allowed by default in GCE
    network = "default"
    access_config {
      // Ephemeral IP
    }
  }
}

resource "random_password" "root_password" {
  count  = var.instance_count
  length = 4
}

data "external" "ping_script_output" {
  program = ["python3", "./modules/compute/ping.py"]
  query = {
    instance_ips = jsonencode([
      for instance in google_compute_instance.instance : {
        instance_name = instance.name
        internal_ip   = instance.network_interface[0].network_ip
        external_ip   = instance.network_interface[0].access_config[0].nat_ip
      }
    ])
  }
}