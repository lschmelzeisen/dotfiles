#!/usr/bin/env sh
TEMPDIR="$(mktemp --directory --tmpdir 'chezmoi-XXXXXXXXXX-install-orchis-theme')"
cd "$TEMPDIR"
git clone "https://github.com/vinceliuice/Orchis-theme" "$TEMPDIR"
"$TEMPDIR/install.sh" --dest "${XDG_DATA_HOME:-$HOME/.local/share}/themes" --theme all
rm -rf "$TEMPDIR"
