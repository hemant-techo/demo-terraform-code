resource "google_secret_manager_secret" "secrets" {
  count     = length(var.secrets)
  secret_id = var.secrets[count.index].name
  labels = {
    project = var.secrets[count.index].label
  }
  replication {
    automatic = true
  }
}

resource "google_secret_manager_secret_version" "secret_version" {
  count       = length(var.secrets)
  secret      = google_secret_manager_secret.secrets[count.index].id
  secret_data = var.secrets[count.index].value
}