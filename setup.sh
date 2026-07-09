#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
SOURCE_FILE="${SCRIPT_DIR}/.tmux.conf"
TARGET_FILE="${HOME}/.tmux.conf"

if [[ ! -f "${SOURCE_FILE}" ]]; then
  echo "Could not find ${SOURCE_FILE}" >&2
  exit 1
fi

SOURCE_REALPATH="$(realpath "${SOURCE_FILE}")"

if [[ -e "${TARGET_FILE}" || -L "${TARGET_FILE}" ]]; then
  TARGET_REALPATH="$(realpath "${TARGET_FILE}" 2>/dev/null || true)"

  if [[ "${TARGET_REALPATH}" == "${SOURCE_REALPATH}" ]]; then
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
