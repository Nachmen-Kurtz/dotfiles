#!/bin/bash

dnf check-update > "$HOME/System/Logs/DNF/$(date +%F_%H-%M-%S).log"
