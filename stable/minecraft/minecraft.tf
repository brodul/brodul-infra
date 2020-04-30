resource "hcloud_server" "minecraft" {
  name        = "minecraft"
  image       = "debian-10"
  server_type = "cx31-ceph"
}

data "cloudflare_zones" "brodul_org" {
  filter {
    name   = "brodul.org"
    status = "active"
    paused = false
  }
}

resource "cloudflare_record" "minecraft_server_brodul_org" {
  zone_id = data.cloudflare_zones.brodul_org.zones[0].id
  name    = "minecraft-server"
  value   = hcloud_server.minecraft.ipv4_address
  type    = "A"
}
