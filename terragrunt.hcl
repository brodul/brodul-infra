remote_state {
  backend = "gcs"

  config = {
    bucket = "brodul-infra-tf-state"
    prefix = "${path_relative_to_include()}/terraform.tfstate"
  }
}