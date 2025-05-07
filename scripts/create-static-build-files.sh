#!/usr/bin/env bash

set -x

mkdir -p static-build-files/public
cp -R public/ static-build-files/public
adminer_version=${ADMINER_VERSION:-"5.3.0"}
curl -f -L -o static-build-files/public/adminer.php "https://github.com/vrana/adminer/releases/download/v${adminer_version}/adminer-${adminer_version}.php"

cat config/php/*.ini > static-build-files/php.ini
cp composer.* static-build-files/
