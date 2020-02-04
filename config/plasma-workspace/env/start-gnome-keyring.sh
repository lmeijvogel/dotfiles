#!/bin/sh

# Possible components: pkcs11,secrets,ssh,gpg
export $(gnome-keyring-daemon --start --components=ssh)
