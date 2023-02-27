resource "google_compute_network" "vpc_network" {
  name                    = var.vpc_name
  auto_create_subnetworks = true
  mtu                     = 1460
}

resource "google_compute_subnetwork" "subnet" {
  name                     = var.subnet_name
  ip_cidr_range            = "10.1.0.0/28"
  region                   = var.project_region
  network                  = google_compute_network.vpc_network.id
  private_ip_google_access = true
}

resource "google_vpc_access_connector" "connector" {
  name = var.connector_name
  subnet {
    name = google_compute_subnetwork.subnet.name
  }
  machine_type   = var.connector_machine_type
  max_instances  = 10
  min_instances  = 2
  max_throughput = 1000

}

resource "google_compute_global_address" "private_ip_alloc" {
  name          = "private-ip-alloc"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.vpc_network.id
}

# Create a private connection
resource "google_service_networking_connection" "private_service_connection" {
  network                 = google_compute_network.vpc_network.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_alloc.name]
}

resource "google_compute_firewall" "firewall" {
  name      = "allow-ssh-ingress-from-iap"
  network   = google_compute_network.vpc_network.name
  direction = "INGRESS"

  allow {
    protocol = "icmp"
  }

  allow {
    protocol = "tcp"
  }

  source_ranges = ["35.235.240.0/20"]
}