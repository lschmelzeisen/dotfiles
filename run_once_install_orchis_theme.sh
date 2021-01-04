#!/usr/bin/env sh
TEMPDIR="$(mktemp --directory)"
cd "$TEMPDIR"
git clone "https://github.com/vinceliuice/Orchis-theme" "$TEMPDIR"
"$TEMPDIR/install.sh" --dest "${XDG_DATA_HOME:-$HOME/.local/share}/themes"
rm -r "$TEMPDIR"
