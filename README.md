# brodul personal infrastructure

This is an experiment, if I can have my personal infrastructure opened up as much as possible.

@brodul on twitter

## Tools used

For provisioning we will use:

- Terraform and terragrunt
- Ansible

For secret management:

- Mozilla SOPS with Google KMS

## How it works?

Terragrunt has a hook that will call `sops` to decrypt `secret.enc.tfvars` to `secret.tfvars`. Once decrypted the `secret.tfvars` is passed to terragrunt as terraform variables. 

If you want to reproduce please open a Github issue and I will help you out. 
