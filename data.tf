data "terraform_remote_state" "foo" {
  backend = "gcs"
  config = {
    bucket  = "ucu-devops-hw-terraform-state"
    prefix  = "terraform/state"
  }
}

# Terraform state from local file
# resource "local_file" "foo" {
#   content  = data.terraform_remote_state.foo.outputs.greeting
#   filename = "${path.module}/outputs.txt"
# }

# OS image data source
# data "google_compute_image" "os" {
#   family  = var.image_family
#   project = var.image_project
# }