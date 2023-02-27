resource "google_project_service" "gcp-apis" {
  for_each = toset(var.gcp_apis)
  service  = each.value

  timeouts {
    create = "30m"
    update = "40m"
  }

  disable_dependent_services = true
  disable_on_destroy         = true
}