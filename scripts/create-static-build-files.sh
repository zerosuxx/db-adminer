#!/usr/bin/env bash

set -x

cat config/php/*.ini > static-build-files/php.ini
cp *.php static-build-files/