#!/usr/bin/env bash

set -x

mkdir -p static-build-files/public
cd static-build-files || exit 1
cp public/ public
adminer_version=${ADMINER_VERSION:-'5.3.0'}
curl -L -o public/adminer.php "https://github.com/vrana/adminer/releases/download/v${adminer_version}/adminer-${adminer_version}.php"

cat config/php/*.ini > php.ini
cp composer.* /
