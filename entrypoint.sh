#!/usr/bin/env bash

export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"

printf "Current Desktop Environment: [%s]\n" "${XDG_CURRENT_DESKTOP}"
printf "Current Session Type: [%s]\n" "${XDG_SESSION_TYPE}"
printf "Running Wire Desktop with the following arguments: [%s]\n" "$@"

exec zypak-wrapper "/app/Wire/wire-desktop" "$@"
