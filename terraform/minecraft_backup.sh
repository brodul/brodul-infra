#! /usr/bin/env bash

if [ ! -f /home/minecraft/.local/bin/b2 ]; then
    echo "B2 is not installed"
    pip install --user b2 > /dev/null 2> /dev/null &
    echo "Installing now ..."
    until [ "$inputok" -eq "y" ]; do
    echo
    echo "Write down auth cresd"
    echo "Key ID:"
    read KEY_ID
    echo "Key:"
    read KEY
    echo
    echo "Are the creds ok?"
    echo "KEY_ID: $KEY_ID"
    echo "KEY: $KEY"
    echo "y/N"
    read inputok
    done
    wait
    /home/minecraft/.local/bin/b2 authorize-account "$KEY_ID" "$KEY"
fi
rcon-cli save-off
rcon-cli save-all
/home/minecraft/.local/bin/b2 sync . b2://brodul-minecraft-backup
rcon-cli save-on
