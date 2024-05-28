#!/usr/bin/env bash

set -x

for file in dist/frankenphp*
do
  name=${file%%-*}
  os_arch=${file#*-}
  os=${os_arch%-*}
  arch=${os_arch##*-}
  new_file_name="${name//frankenphp/adminer}-${arch//arm64/aarch64}-${os//mac/darwin}"

  mv "$file" "$new_file_name"
done
