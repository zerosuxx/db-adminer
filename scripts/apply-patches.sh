#!/usr/bin/env bash

set -exo pipefail

ls -al caddy/frankenphp/
cat caddy/frankenphp/main.go
cp scripts/caddy/frankenphp/main.go ./caddy/frankenphp/main.go
cat caddy/frankenphp/main.go