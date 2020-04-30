variable "cloudflare_email" {
}

variable "cloudflare_api_key" {
}

provider "cloudflare" {
  version = "~> 2.0"
  email   = var.cloudflare_email
  api_key = var.cloudflare_api_key
}
