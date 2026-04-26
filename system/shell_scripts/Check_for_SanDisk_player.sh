#!/bin/bash

PLAYER="/run/media/nachmen/9C33-6BBD"

if [[ -d "$PLAYER" ]]; then
    echo "Available."
else
    echo "Unavailable."
fi
