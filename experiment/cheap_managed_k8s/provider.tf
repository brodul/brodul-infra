variable "linode_token" {
}

provider "linode" {
  token = var.linode_token
}
