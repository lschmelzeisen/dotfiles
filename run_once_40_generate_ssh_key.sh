#!/usr/bin/env sh
if [ ! -f "$HOME/.ssh/id_ed25519" ] ; then
    ssh-keygen -t ed25519 -N "" -f "$HOME/.ssh/id_ed25519"
fi
