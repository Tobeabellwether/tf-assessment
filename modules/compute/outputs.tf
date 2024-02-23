output "root_passwords" {
  value     = random_password.root_password.*.result
  sensitive = true
}