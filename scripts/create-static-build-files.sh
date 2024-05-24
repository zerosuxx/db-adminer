#!/usr/bin/env bash

set -x

mkdir -p static-build-files/public
cat config/php/*.ini > static-build-files/php.ini
cp *.php static-build-files/public
cp composer.* static-build-files/
