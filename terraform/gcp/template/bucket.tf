resource "google_storage_bucket" "vectice_project" {
  name          = var.project_bucket_name
  location      = var.storage_location
  storage_class = var.storage_class
}

