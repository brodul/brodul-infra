resource "hcloud_server" "minecraft" {
  name        = "minecraft"
  image       = "debian-10"
  server_type = "cx31-ceph"
}

resource "hcloud_server" "node1" {
  name        = "node1"
  image       = "debian-9"
  server_type = "cx11"
  #user_data = "#cloud-config\nruncmd:\n- [touch, /root/cloud-init-worked]\n"
  user_data = <<-EOF
  #cloud-config
  runcmd:
    - 'curl http://requestbin.net/r/1020uc21?lol'
  EOF
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

