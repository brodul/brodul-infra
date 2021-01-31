resource "linode_lke_cluster" "experiment-cluster" {
  label       = "experiment-cluster"
  k8s_version = "1.18"
  region      = "eu-central"
  tags        = ["experiment"]

  pool {
    type  = "g6-standard-1"
    count = 1
  }
}
