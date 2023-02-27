resource "google_artifact_registry_repository" "dashboard" {
  location      = var.location
  repository_id = var.repo-name
  description   = "DRL Dashboard Docker Registry"
  format        = "DOCKER"
}

resource "google_artifact_registry_repository" "backend" {
  location      = var.location
  repository_id = var.repo-name-2
  description   = "DRL Backend Docker Registry"
  format        = "DOCKER"
}