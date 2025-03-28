#!/usr/bin/env bash

set_secret_store () {
  case "${WIRE_SECRET_STORE}" in
    "gnome-libsecret" | "kwallet" | "kwallet5" | "kwallet6") # https://www.electronjs.org/docs/latest/api/safe-storage/#safestoragegetselectedstoragebackend-linux
      EXTRA_ARGS=("--password-store=${WIRE_SECRET_STORE}")
      ;;
    *)
      printf "Wire requires access to your system's keychain for secure credential storage.\n"
      printf "WIRE_SECRET_STORE environment variable is set to [%s], but it must be one of the following [gnome-libsecret, kwallet, kwallet5, kwallet6].\n" "${WIRE_SECRET_STORE}"
      exit 1
      ;;
  esac
}

# -------------------------------------------------------------------------------------------------
#
# -------------------------------------------------------------------------------------------------

export TMPDIR="${XDG_RUNTIME_DIR}/app/${FLATPAK_ID}"
export WIRE_SECRET_STORE="${WIRE_SECRET_STORE:-unknown}"

EXTRA_ARGS=()

set_secret_store

printf "Running Wire Desktop with the following arguments: [%s]\n" "${EXTRA_ARGS[@]}"

exec zypak-wrapper "/app/Wire/wire-desktop" "${EXTRA_ARGS[@]}" "$@"
