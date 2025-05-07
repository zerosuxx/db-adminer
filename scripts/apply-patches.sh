#!/usr/bin/env bash

set -x

patch caddy/frankenphp/main.go < <(diff -u <(curl -fs "https://raw.githubusercontent.com/dunglas/frankenphp/refs/tags/v${FRANKENPHP_VERSION:-"1.5.0"}/caddy/frankenphp/main.go") ./caddy/frankenphp/main.go)
