# GCS bucket for application/data
resource "google_storage_bucket" "app_bucket" {
  name     = var.bucket_name != "" ? var.bucket_name : "${var.project_id}-terraform-app-bkt"
  location = var.region
  force_destroy = true
  uniform_bucket_level_access = true
}

# BigQuery dataset
resource "google_bigquery_dataset" "dataset" {
  dataset_id   = "ucu_devops_hw_dataset"
  project      = var.project_id
  location     = var.location
  friendly_name = "Terraform created dataset"
}

# VM instance
resource "google_compute_instance" "vm" {
  project      = var.project_id
  name         = var.vm_name
  machine_type = var.machine_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = "centos-stream-9"
    }
  }

  network_interface {
    network = "default"
    access_config {
		
	}
  }

  tags = ["ssh", "devops-course"]

  metadata_startup_script = <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -yq nginx
    echo "Hello from Terraform-created VM" > /var/www/html/index.html
    systemctl enable nginx
    systemctl start nginx
  EOF
}


