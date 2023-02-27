resource "google_sql_database_instance" "drl_psql" {
  provider = google-beta

  name             = var.db_instance_name
  project          = var.project_name
  region           = var.db_region
  database_version = "POSTGRES_14"
  settings {
    disk_size = var.db_instance_storage
    tier      = var.db_instance_tier
    ip_configuration {
      ipv4_enabled    = true
      private_network = var.private_network
    }
    backup_configuration {
      enabled = true
    }
  }
}

resource "google_sql_user" "users" {
  name     = var.username
  instance = google_sql_database_instance.drl_psql.name
  password = var.password
}

resource "google_sql_database" "database" {
  count    = length(var.database_name)
  name     = var.database_name[count.index]
  instance = google_sql_database_instance.drl_psql.name
}


