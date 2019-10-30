#!/usr/bin/env sh

set -o errexit

TMPDIR="${XDG_CACHE_HOME}"/tmp/
export TMPDIR

exec env /app/Wire/wire-desktop "$@"
