variable "do_token" {}

# Configure the DigitalOcean Provider
provider "digitalocean" {
  token = "${var.do_token}"
}

provider "google" {
  project = "brodul-infra"
  region  = "europe-west1"
}

terraform {
  required_providers {
    digitalocean = "= 1.11"
    google       = "= 2.10"
  }
  backend "gcs" {
    bucket = "brodul-infra-tf-state"
    prefix = "terraform/state"
  }

}
