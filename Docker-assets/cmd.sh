#!/usr/bin/env bash
# shellcheck disable=SC1090,SC2155
set -o errexit
set -o nounset
set -o pipefail
[[ -n "${TRACE+x}" ]] && set -o xtrace

./src/flyway info
./src/flyway migrate
./src/flyway info
