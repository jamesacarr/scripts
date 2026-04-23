#!/bin/bash

# Post-install steps that must run after packages are installed.
# Safe to re-run; each step should be idempotent and tolerant of missing tools.

if command -v agent-browser &> /dev/null; then
  echo "Running agent-browser install..."
  agent-browser install
  echo "agent-browser ready"
else
  echo "agent-browser not found, skipping"
fi
