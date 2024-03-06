variable "gcp_credentials_path" {
  description = "Path to the Google Cloud Platform service account JSON file"
  type        = string
}

variable "gcp_project" {
  description = "The GCP project ID"
  type        = string
}

variable "gcp_zone" {
  description = "The GCP zone"
  type        = string
}

variable "user_name" {
  description = "User name"
  type        = string
}

variable "public_ssh_key_path" {
  description = "Public SSH key path"
  type        = string
}


variable "instance_prefix" {
  description = "Prefix for the instance names"
  type        = string
}

variable "instance_count" {
  description = "Number of instances to create"
  type        = number

  validation {
    condition     = var.instance_count >= 2 && var.instance_count <= 100
    error_message = "The number of instances must be between 2 and 100."
  }
}

variable "instance_type" {
  description = "The type of the instance to create"
  type        = string
}

variable "instance_disk_size" {
  description = "The disk size of the instance in GB"
  type        = number
}

variable "instance_image" {
  description = "The image resource for the instances"
  type        = string
}