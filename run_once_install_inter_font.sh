#!/usr/bin/env sh
TEMPDIR=$(mktemp --directory)
curl --location --output $TEMPDIR/inter.zip https://github.com/rsms/inter/releases/download/v3.15/Inter-3.15.zip
unzip $TEMPDIR/inter.zip -d $TEMPDIR
mkdir -p ~/.local/share/fonts/inter
cp "$TEMPDIR/Inter Desktop"/*.{otf,ttf} ~/.local/share/fonts/inter
rm -r $TEMPDIR
fc-cache
