resource "google_redis_instance" "redis" {
  name               = var.instance_name
  tier               = var.instance_tier
  memory_size_gb     = var.instance_size
  region             = var.instance_region
  redis_version      = "REDIS_6_X"
  authorized_network = var.vpc_name
  replica_count      = var.replica_count
  connect_mode       = "PRIVATE_SERVICE_ACCESS"
  read_replicas_mode = "READ_REPLICAS_ENABLED"
}
