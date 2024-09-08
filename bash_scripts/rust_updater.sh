#!/bin/bash

UPDATE_LOG="/var/log/rust_update.log"

CURRENT_DATE=$(date +%s)

if [ ! -f "$UPDATE_LOG" ]; then
    echo "Log file not found. Performing initial rust and cargo update."
    rustup update
    date +%s > "$UPDATE_LOG"
    exit 0
fi

LAST_UPDATE=$(cat "$UPDATE_LOG")

DIFF_DAYS=$(( (CURRENT_DATE - LAST_UPDATE) / 86400 ))

if [ "$DIFF_DAYS" -ge 7 ]; then
    echo "More than a week has passed. Updating rust."
    rustup update
    date +%s > "$UPDATE_LOG"
else
    echo "Rust is up-to-date. Last update was $DIFF_DAYS days ago."
fi
