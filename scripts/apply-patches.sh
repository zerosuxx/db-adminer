#!/usr/bin/env bash

set -x

patch caddy/frankenphp/main.go < ./patches/caddy_frankenphp_main_go.patch