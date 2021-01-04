#!/usr/bin/env bash
if [ -d "$HOME/.java" ] ; then
    mv "$HOME/.java" "${XDG_CONFIG_HOME:-$HOME/.config}/java"
fi

if [ -d "$HOME/.pki/nssdb" ] ; then
    mv "$HOME/.pki/nssdb" "${XDG_DATA_HOME:-$HOME/.local/share}/pki/nssdb"
    rmdir "$HOME/.pki"
fi
