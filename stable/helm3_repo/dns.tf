data "cloudflare_zones" "brodul_org" {
  filter {
    name = "brodul.org"
  }
}

resource "cloudflare_record" "helm3_brodul_org" {
  zone_id = data.cloudflare_zones.brodul_org.zones[0].id
  name    = "helm3.brodul.org"
  value   = "c.storage.googleapis.com"
  type    = "CNAME"
  ttl     = 1
  proxied = true
}
