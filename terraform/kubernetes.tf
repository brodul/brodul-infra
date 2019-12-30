resource "digitalocean_kubernetes_cluster" "brodul-kube-cluster" {
  name   = "brodul-kube-cluster"
  region = "ams3"
  // Grab the latest version slug from `doctl kubernetes options versions`
  version = "1.16.2-do.1"
  tags    = ["terraform"]

  node_pool {
    name       = "primary-worker-pool"
    size       = "s-1vcpu-2gb"
    node_count = 1
    tags       = ["terraform", "primary"]
  }

}

resource "digitalocean_kubernetes_node_pool" "secondary-worker-pool" {
  name       = "secondary-worker-pool"
  cluster_id = digitalocean_kubernetes_cluster.brodul-kube-cluster.id
  size       = "s-1vcpu-2gb"
  auto_scale = true
  min_nodes  = 0
  max_nodes  = 2

  tags = ["terraform", "secondary"]

}

data "digitalocean_droplet" "main_node" {
  name = digitalocean_kubernetes_cluster.brodul-kube-cluster.node_pool[0].nodes[0].name
}

resource "digitalocean_floating_ip" "main_node_ip" {
  droplet_id = data.digitalocean_droplet.main_node.id
  region     = data.digitalocean_droplet.main_node.region
}
