resource "cloudflare_zone" "brodul_org" {
  zone = "brodul.org"
}

resource "cloudflare_zone" "brodul_dev" {
  zone = "brodul.dev"
}

resource "cloudflare_zone" "brodul_com" {
  zone = "brodul.com"
}

resource "cloudflare_zone" "scoby_app" {
  zone = "scoby.app"
}
