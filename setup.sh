#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_FILE="${SCRIPT_DIR}/.tmux.conf"
TARGET_FILE="${HOME}/.tmux.conf"

if ! command -v tmux >/dev/null 2>&1; then
  echo "tmux is required but was not found in PATH" >&2
  exit 1
fi

if [[ ! -f "${SOURCE_FILE}" ]]; then
  echo "Could not find ${SOURCE_FILE}" >&2
  exit 1
fi

if [[ -e "${TARGET_FILE}" || -L "${TARGET_FILE}" ]]; then
  if [[ "${TARGET_FILE}" -ef "${SOURCE_FILE}" ]]; then
    echo "tmux config is already installed at ${TARGET_FILE}"
    exit 0
  fi

  BACKUP_FILE="${TARGET_FILE}.bak.$(date +%Y%m%d%H%M%S)"
  mv "${TARGET_FILE}" "${BACKUP_FILE}"
  echo "Backed up existing tmux config to ${BACKUP_FILE}"
fi

ln -s "${SOURCE_FILE}" "${TARGET_FILE}"
echo "Installed tmux config to ${TARGET_FILE}"
echo "Reload it with: tmux source-file ~/.tmux.conf"
