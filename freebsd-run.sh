#!/usr/bin/env sh
# Helper script to run commands inside the FreeBSD VM.
# If no arguments are provided, an interactive shell is opened.

PORT=2222

if [ $# -eq 0 ]; then
  exec ssh -o StrictHostKeyChecking=no -p "$PORT" codex@localhost
else
  exec ssh -o StrictHostKeyChecking=no -p "$PORT" codex@localhost "$@"
fi
