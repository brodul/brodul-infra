remote_state {
  backend = "gcs"

  config = {
    bucket = "brodul-infra-tf-state"
    prefix = "${path_relative_to_include()}/terraform.tfstate"
  }
}

terraform {
  before_hook "decrypt_secrets" {
    commands = ["apply", "plan"]
    execute  = ["bash", "${path_relative_from_include()}/utils.sh", "dec_secrets"]
  }

  after_hook "delete_decrypted_secrets" {
    commands     = ["apply", "plan"]
    execute      = ["bash", "${path_relative_from_include()}/utils.sh", "delete_secrets"]
    run_on_error = true
  }
}
