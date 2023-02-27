output "network_id" {
  value = google_compute_network.vpc_network.id
}

output "vpc_connector_name" {
  value = google_vpc_access_connector.connector.name
}