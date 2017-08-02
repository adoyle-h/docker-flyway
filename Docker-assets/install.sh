#!/usr/bin/env bash
# shellcheck disable=SC1090
set -o errexit
set -o nounset
set -o pipefail
[[ -n "${TRACE+x}" ]] && set -o xtrace

CUR_FILE_DIR="$(cd "$( dirname "$0" )" && pwd)"

source "$CUR_FILE_DIR"/logger.sh ""
ENTER

INFO "[Todo] apk update"
until apk update; do sleep 1; done
INFO "[Done] apk update"

INFO "[Todo] apk add packages"
# apk add --no-cache
INFO "[Done] apk add packages"

./src/download "" "$FLYWAY_VERSION"

EXIT
