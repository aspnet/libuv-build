#!/usr/bin/env sh
#
# Copyright (c) .NET Foundation and contributors. All rights reserved.
# Licensed under the MIT license. See LICENSE file in the project root for full license information.
#

if command -v uuidgen &>/dev/null; then
  uuidgen # Debian, macOS etc.
elif [[ -e /proc/sys/kernel/random/uuid ]]; then
  cat /proc/sys/kernel/random/uuid  # for OS like Alpine
elif [[ -e /compat/linux/proc/sys/kernel/random/uuid ]]; then
  cat /compat/linux/proc/sys/kernel/random/uuid # for OS like FreeBSD
else
  echo 'No UUID generator found'
  exit 1
fi
