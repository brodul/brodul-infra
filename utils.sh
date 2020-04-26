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
    for enc_file in $(find . -iname 'secret.enc.tfvars'); do
        dec_file_dir="$(dirname $enc_file)"
        dec_file="$dec_file_dir/secret.tfvars"
        sops -d "$enc_file" > "$dec_file"
    done
}


$@
