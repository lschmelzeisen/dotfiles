#!/usr/bin/env sh
# Based on https://github.com/nagygergo/jetbrains-toolbox-install/blob/master/jetbrains-toolbox.sh

DIR=~/.local/share/JetBrains/Toolbox

if [ ! -d $DIR ] ; then
    URL=$(curl \
        "https://data.services.jetbrains.com//products/releases?code=TBA&latest=true&type=release" \
        -H "Origin: https://www.jetbrains.com" \
        -H "Accept-Encoding: gzip, deflate, br" \
        -H "Accept-Language: en-US,en;q=0.8" \
        -H "User-Agent: Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" \
        -H "Accept: application/json, text/javascript, */*; q=0.01" \
        -H "Referer: https://www.jetbrains.com/toolbox/download/" \
        -H "Connection: keep-alive" \
        -H "DNT: 1" \
        --compressed | grep -Po '"linux":.*?[^\\]",' | awk -F ':' '{print $3,":"$4}'| sed 's/[", ]//g')

    TEMPDIR=$(mktemp --directory --tmpdir 'chezmoi-XXXXXXXXXX-install-jetbrains-toolbox')
    curl --location --output $TEMPDIR/jetbrains-toolbox.tar.gz $URL

    mkdir $DIR
    tar -xzf $TEMPDIR/jetbrains-toolbox.tar.gz --directory ${DIR} --strip-components 1

    rm -r $TEMPDIR
fi
