variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type        = string
  default     = "europe-west1"
}

variable "zone" {
  type        = string
  default     = "europe-west1-b"
}

variable "location" {
  type        = string
  default     = "EU" # BigQuery dataset location
}

variable "bucket_name" {
  type        = string
  description = "GCS bucket name for app/data (must be globally unique)"
}

variable "vm_name" {
  type        = string
  default     = "tf-homework-vm"
}

variable "machine_type" {
  type        = string
  default     = "e2-medium"
}

variable "image_family" {
  type        = string
  default     = "debian-11"
}

variable "image_project" {
  type        = string
  default     = "debian-cloud"
}
