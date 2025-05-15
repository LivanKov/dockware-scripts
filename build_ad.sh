#!/bin/bash
# Replace these with your remote container's SSH credentials
. "$(dirname "${BASH_SOURCE[0]}")/config.sh"

if ! command -v sshpass &> /dev/null; then
    echo "sshpass is required but not installed." >&2
    exit 1
fi
shopt -s expand_aliases
alias ssh='sshpass -p "$SSH_PASS" ssh'
# Command to run inside the remote container
REMOTE_COMMAND="./html/bin/build-administration.sh"

ssh "${SSH_USER}@${SSH_HOST}" "${REMOTE_COMMAND}"