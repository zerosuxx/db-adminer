#!/usr/bin/env bash

set -exo pipefail

cp scripts/caddy/frankenphp/main.go ./caddy/frankenphp/main.go
cp scripts/build-static.sh ./build-static.sh