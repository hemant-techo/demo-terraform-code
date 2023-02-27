variable "gcp_apis" {
  type        = set(string)
  description = "List of APIs to enable"
  default = [
    "compute.googleapis.com",          # Compute engine
    "run.googleapis.com",              # Cloud run
    "vpcaccess.googleapis.com",        # serverless vpc access
    "secretmanager.googleapis.com",    # Secret Manager 
    "logging.googleapis.com",          # Cloud Logging
    "monitoring.googleapis.com",       # Cloud Monitoring
    "cloudbuild.googleapis.com",       # Cloud Build
    "sqladmin.googleapis.com",         # Cloud SQL
    "cloudscheduler.googleapis.com",   # Cloud Scheduler
    "redis.googleapis.com",            # Cloud Memorystore for Redis
    "artifactregistry.googleapis.com", # Artifact Registry
    "servicenetworking.googleapis.com" # Service Networking 
  ]
}