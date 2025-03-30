#!/usr/bin/env bash

export ELECTRON_OZONE_PLATFORM_HINT="auto" # https://www.electronjs.org/docs/latest/api/environment-variables#electron_ozone_platform_hint-linux
export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"

printf "Current Desktop Environment: [%s]\n" "${XDG_CURRENT_DESKTOP}"
printf "Current Session Type: [%s]\n" "${XDG_SESSION_TYPE}"
printf "Running Wire Desktop with the following arguments: [%s]\n" "$@"

exec zypak-wrapper "/app/Wire/wire-desktop" "$@"
