resource "google_container_cluster" "primary" {
  name     = "brodul-gke-cluster"
  location = "us-central1"

  # We can't create a cluster with no node pool defined, but we want to only use
  # separately managed node pools. So we create the smallest possible default
  # node pool and immediately delete it.
  remove_default_node_pool = true
  initial_node_count       = 1

}

resource "google_container_node_pool" "primary_b_nodes" {
  name       = "b-node-pool"
  location   = "europe-west1-b"
  cluster    = "${google_container_cluster.primary.name}"
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "g1-small"

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
resource "google_container_node_pool" "primary_c_nodes" {
  name       = "c-node-pool"
  location   = "europe-west1-c"
  cluster    = "${google_container_cluster.primary.name}"
  node_count = 1

  node_config {
    preemptible  = true
    machine_type = "g1-small"

    oauth_scopes = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
    ]
  }
}
