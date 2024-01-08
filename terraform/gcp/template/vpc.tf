# Define a VPC
resource "google_compute_network" "vectice_vpc" {
  name                    = var.network
  auto_create_subnetworks = false
}

resource "google_compute_global_address" "private_ip_alloc" {
  name          = "private-ip-alloc"
  purpose       = "VPC_PEERING"
  address_type  = "INTERNAL"
  prefix_length = 16
  network       = google_compute_network.vectice_vpc.id
}
resource "google_service_networking_connection" "vectice" {
  network                 = google_compute_network.vectice_vpc.id
  service                 = "servicenetworking.googleapis.com"
  reserved_peering_ranges = [google_compute_global_address.private_ip_alloc.name]
}

# Define subnet 1
resource "google_compute_subnetwork" "subnet1" {
  name          = "${var.subnetwork}1"
  ip_cidr_range = var.cidr_range_subnet1
  region        = var.region # Change this to your desired region
  network       = google_compute_network.vectice_vpc.self_link
}

# Define subnet 2
resource "google_compute_subnetwork" "subnet2" {
  name          = "${var.subnetwork}2"
  ip_cidr_range = var.cidr_range_subnet2
  region        = var.region # Change this to your desired region
  network       = google_compute_network.vectice_vpc.self_link
}