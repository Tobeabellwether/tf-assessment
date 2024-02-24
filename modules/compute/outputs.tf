output "instance_root_passwords" {
  value     = random_password.root_password.*.result
  sensitive = true
}

output "instance_ips" {
  value = [for instance in google_compute_instance.instance : {
    "instance_name" = instance.name
    "internal_ip"   = instance.network_interface[0].network_ip
    "external_ip"   = instance.network_interface[0].access_config[0].nat_ip
  }]
}