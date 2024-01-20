#!/bin/bash

function log() {
    if [[ "$1" = "info" ]]; then
        echo "INFO : $2"
    elif [[ "$1" = "err" || "$1" = "error" ]]; then
        echo "ERROR: $2"
    elif [[ "$1" = "start" ]]; then
        echo "START: $2"
    elif [[ "$1" = "done" ]]; then
        echo "START: $2"
    elif [[ "$1" = "warn" ]]; then
        echo "WARN : $2"
    elif [[ "$1" = "done" ]]; then
        echo "DEBUG: $2"
    else
        echo "LOG  : $2"
    fi
}

if [[ $1 = "err-end" ]]; then
    echo "ERROR: === Debug info above ==="
fi