#!/usr/bin/env bash

set -x

for i in dist/frankenphp*
do
    mv "$i" "${i/frankenphp/adminer}"
done