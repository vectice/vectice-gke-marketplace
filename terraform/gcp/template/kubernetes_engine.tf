resource "google_container_cluster" "vectice" {
  name     = var.cluster_name
  location = var.region

  initial_node_count       = 1
  remove_default_node_pool = true

  release_channel {
    channel = "REGULAR"
  }

  # Adding this block enables IP aliasing, making the cluster VPC-native instead of routes-based.
  ip_allocation_policy {}

  network = "projects/${var.project_id}/global/networks/${var.network}"
  subnetwork = google_compute_subnetwork.subnet1.id

  enable_shielded_nodes = true

  workload_identity_config {
    identity_namespace = "${var.project_id}.svc.id.goog"
  }
}

resource "google_container_node_pool" "vectice" {
  name     = var.node_pool_name
  cluster  = google_container_cluster.vectice.name
  location = google_container_cluster.vectice.location

  initial_node_count = var.initial_node_count
  autoscaling {
    min_node_count = var.min_node_count
    max_node_count = var.max_node_count
  }

  node_config {
    image_type   = "COS_CONTAINERD"
    machine_type = var.machine_type
    disk_type    = "pd-standard"
    disk_size_gb = 100

    oauth_scopes = [
      "https://www.googleapis.com/auth/devstorage.read_only",
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      "https://www.googleapis.com/auth/servicecontrol",
      "https://www.googleapis.com/auth/service.management.readonly",
      "https://www.googleapis.com/auth/trace.append",
    ]
  }
}
