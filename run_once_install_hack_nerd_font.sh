#!/usr/bin/env sh
TEMPDIR=$(mktemp --directory --tmpdir 'chezmoi-XXXXXXXXXX-install-hack-nerd-font')
curl --location --output $TEMPDIR/hack-nerd-font.zip https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
unzip $TEMPDIR/hack-nerd-font.zip -d $TEMPDIR
mkdir -p ~/.local/share/fonts/hack-nerd-font
cp $TEMPDIR/*.ttf ~/.local/share/fonts/hack-nerd-font
rm -r $TEMPDIR
fc-cache
