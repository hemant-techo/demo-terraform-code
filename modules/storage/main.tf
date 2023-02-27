resource "google_storage_bucket" "tf-state-bucket" {
  name                        = var.bucket_name
  location                    = var.bucket_region
  project                     = var.project_name
  uniform_bucket_level_access = true
  versioning {
    enabled = true
  }
}