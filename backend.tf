terraform {
  backend "gcs" {
    bucket  = "ucu-devops-hw-terraform-state"     # replace with your own globally-unique GCS bucket name
    prefix  = "terraform/state"
  }
}
