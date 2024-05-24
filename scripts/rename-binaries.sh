#!/usr/bin/env bash

set -x

for i in dist/*
do
    mv "$i" "${i/frankenphp/adminer}"
done