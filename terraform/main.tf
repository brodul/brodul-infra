provider "google" {

  project = "brodul-infra"
  region  = "europe-west1"
}

terraform {
  backend "gcs" {
    bucket = "brodul-infra-tf-state"
    prefix = "terraform/state"
  }
}
