#!/bin/sh
# xbps-update.sh — system update script for cronie on Void Linux

LOGDIR="/var/log/xbps-update"
LOCK="/var/run/xbps-update.lock"
HOSTNAME="$(hostname)"
SCRIPT="xbps_update"
PID="$$"
SESSION_START="$(date '+%FT%H-%M-%S')"
LOG="$LOGDIR/${SESSION_START}.log"

mkdir -p "$LOGDIR"

log() {
    local severity="$1"
    shift
    echo "$(date '+%F %T') $HOSTNAME $SCRIPT[$PID]: $severity: $*" >> "$LOG"
}

# Prevent overlapping runs
if [ -f "$LOCK" ]; then
    log "WARNING" "Lock file $LOCK exists — another instance may be running. Aborting."
    exit 1
fi

touch "$LOCK"
trap 'rm -f "$LOCK"' EXIT

log "INFO" "Update session started (PID=$PID, USER=$(id -un))"
log "DEBUG" "Lock acquired: $LOCK"
log "DEBUG" "Log file: $LOG"

# --- Package sync and upgrade ---
log "INFO" "Running: xbps-install -Su --yes"
xbps_output="$(xbps-install -Su --yes 2>&1)"
xbps_exit="$?"

echo "$xbps_output" | while IFS= read -r line; do
    [ -n "$line" ] && echo "$(date '+%F %T') $HOSTNAME $SCRIPT[$PID]: INFO: [xbps] $line" >> "$LOG"
done

if [ "$xbps_exit" -eq 0 ]; then
    log "INFO" "xbps-install completed successfully (exit=$xbps_exit)"
elif [ "$xbps_exit" -eq 1 ]; then
    log "INFO" "xbps-install: nothing to upgrade (exit=$xbps_exit)"
else
    log "ERROR" "xbps-install failed (exit=$xbps_exit)"
fi

# --- Stale library check ---
log "INFO" "Running: xcheckrestart"
if command -v xcheckrestart > /dev/null 2>&1; then
    xcheck_output="$(xcheckrestart 2>&1)"
    xcheck_exit="$?"
    if [ -n "$xcheck_output" ]; then
        echo "$xcheck_output" | while IFS= read -r line; do
            [ -n "$line" ] && echo "$(date '+%F %T') $HOSTNAME $SCRIPT[$PID]: WARNING: [xcheckrestart] $line" >> "$LOG"
        done
    else
        log "INFO" "xcheckrestart: no processes using outdated libraries"
    fi
    log "DEBUG" "xcheckrestart exited with code $xcheck_exit"
else
    log "WARNING" "xcheckrestart not found — skipping stale library check"
fi

# --- Retention: purge logs older than 30 days ---
log "INFO" "Running retention cleanup (>30 days)"
deleted="$(find "$LOGDIR" -name '*.log' -mtime +30 -print -delete)"
if [ -n "$deleted" ]; then
    echo "$deleted" | while IFS= read -r f; do
        log "INFO" "[retention] Deleted: $f"
    done
else
    log "DEBUG" "[retention] No old logs to delete"
fi
log "DEBUG" "Retention cleanup done"

# --- Done ---
log "INFO" "Update session finished (PID=$PID)"
