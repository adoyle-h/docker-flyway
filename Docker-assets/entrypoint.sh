#!/usr/bin/env bash
# shellcheck disable=SC1090,SC2155
set -o errexit
set -o nounset
set -o pipefail
[[ -n "${TRACE+x}" ]] && set -o xtrace

source ./Docker-assets/logger.sh ""
ENTER

WAIT_OPTS="${WAIT_OPTS:--s}"

DEBUG "wait-for-it.sh ${WAIT_HOST}:${WAIT_PORT} $WAIT_OPTS -t ${WAIT_TIMEOUT:-30} -- $*"

./Docker-assets/wait-for-it.sh "${WAIT_HOST}":"${WAIT_PORT}" \
    "$WAIT_OPTS" -t "${WAIT_TIMEOUT:-30}" \
    -- \
    "$@"

EXIT
