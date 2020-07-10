#! /usr/bin/env bash
set -e
set -u

function list_secrets {
    find . -iname 'secret.tfvars'
}

function delete_secrets {
    find . -iname 'secret.tfvars' -delete
}

function dec_secrets {
find . -iname 'secret.enc.tfvars' | while read -r enc_file; do
        dec_file_dir="$(dirname "$enc_file")"
        dec_file="$dec_file_dir/secret.tfvars"
        sops -d "$enc_file" > "$dec_file"
    done
}


"$@"
