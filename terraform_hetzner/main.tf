
variable hcloud_token {}

provider "hcloud" {
  token = var.hcloud_token
}

# Create a new server running debian
resource "hcloud_server" "node1" {
  name        = "node1"
  image       = "ubuntu-18.04"
  server_type = "cx11"
}
