#!/usr/bin/env bash
# shellcheck disable=SC1090
set -o errexit
set -o nounset
set -o pipefail
[[ -n "${TRACE+x}" ]] && set -o xtrace

CUR_FILE_DIR="$(cd "$( dirname "$0" )" && pwd)"
source "$CUR_FILE_DIR"/logger.sh ""

ENTER

INFO "Build success!"

EXIT
