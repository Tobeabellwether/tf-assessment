output "instance_root_passwords" {
  value     = random_password.root_password.*.result
  sensitive = true
}

output "ping_output" {
  value = data.external.ping_script_output
}