#!/usr/bin/env sh
TEMPDIR="$(mktemp --directory --tmpdir 'chezmoi-XXXXXXXXXX-install-tela-circle-icons')"
cd "$TEMPDIR"
git clone "https://github.com/vinceliuice/Tela-circle-icon-theme" "$TEMPDIR"
"$TEMPDIR/install.sh" -a -d "${XDG_DATA_HOME:-$HOME/.local/share}/icons"
rm -rf "$TEMPDIR"
