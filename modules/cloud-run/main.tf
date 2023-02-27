resource "google_cloud_run_service" "dynamic-cloud-run" {
  count    = length(var.service_list)
  name     = var.service_list[count.index]
  location = var.project_region

  template {
    metadata {
      annotations = {
        "autoscaling.knative.dev/minScale"        = "1"
        "autoscaling.knative.dev/maxScale"        = "100"
        "run.googleapis.com/cloudsql-instances"   = var.psql_connection_name
        "run.googleapis.com/vpc-access-connector" = var.vpc_connector_name
        "run.googleapis.com/vpc-access-egress"    = "private-ranges-only"
        "run.googleapis.com/client-name"          = "terraform"
      }
    }
    spec {
      containers {
        image = var.image_list[count.index]
        ports {
          container_port = "3000"
        }
        resources {
          limits = {
            cpu    = "4.0"
            memory = "16Gi"
          }
        }
        dynamic "env" {
          for_each = var.env-vars[count.index]
          content {
            name  = env.key
            value = env.value
          }
        }

        dynamic "env" {
          for_each = toset(var.env-secret[count.index])
          content {
            name = env.key
            value_from {
              secret_key_ref {
                key  = "latest"
                name = env.key
              }
            }
          }
        }
      }
    }
  }
}

data "google_iam_policy" "allow-authenticated" {
  binding {
    role = "roles/run.invoker"
    members = [
      "allUsers",
    ]
  }
}

resource "google_cloud_run_service_iam_policy" "allow-authenticated" {
  count    = length(var.service_list)
  location = google_cloud_run_service.dynamic-cloud-run[count.index].location
  project  = google_cloud_run_service.dynamic-cloud-run[count.index].project
  service  = google_cloud_run_service.dynamic-cloud-run[count.index].name

  policy_data = data.google_iam_policy.allow-authenticated.policy_data
}