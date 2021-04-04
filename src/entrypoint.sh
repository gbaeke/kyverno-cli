#!/usr/bin/env bash

set -e
set -o pipefail


echo ">>> Running command"
echo ""

bash -c "set -e;  set -o pipefail; $1"