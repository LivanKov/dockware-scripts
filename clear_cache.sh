#!/bin/bash
# Replace these with your remote container's SSH credentials
REMOTE_USER="dockware"
REMOTE_HOST="localhost"
REMOTE_PASS="dockware"
if ! command -v sshpass &> /dev/null; then
    echo "sshpass is required but not installed." >&2
    exit 1
fi
shopt -s expand_aliases
alias ssh='sshpass -p "$REMOTE_PASS" ssh'
# Command to run inside the remote container
REMOTE_COMMAND="./html/bin/console cache:clear"

ssh "${REMOTE_USER}@${REMOTE_HOST}" "${REMOTE_COMMAND}"