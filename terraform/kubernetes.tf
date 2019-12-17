resource "digitalocean_kubernetes_cluster" "example" {
  name   = "brodul-kube-cluster"
  region = "ams3"
  // Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.16.2-do.1"
  tags    = ["terraform"]

  node_pool {
    name = "worker-pool"
    size = "s-1vcpu-2gb"
    # node_count = 1
    auto_scale = true
    min_nodes  = 1
    max_nodes  = 3
  }

}
