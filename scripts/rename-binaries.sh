#!/usr/bin/env bash

set -x

for i in dist/frankenphp*
do
    mv "$i" "$(echo "$i" | sed -e 's#frankenphp#adminer#g;s#mac#darwin#g')"
done
