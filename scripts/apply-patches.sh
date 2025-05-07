#!/usr/bin/env bash

set -exo pipefail

cp scripts/caddy/frankenphp/main.go ./caddy/frankenphp/main.go
cat caddy/frankenphp/main.go