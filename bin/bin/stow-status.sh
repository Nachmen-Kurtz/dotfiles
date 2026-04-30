#!/usr/bin/env bash
# stow-status.sh — Scan ~/dotfiles and report GNU Stow link status per package.
# Read-only: no stow/unstow actions are performed.

DOTFILES="${DOTFILES_DIR:-$HOME/dotfiles}"
TARGET="${STOW_TARGET:-$HOME}"

# ── Colors ────────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
DIM='\033[2m'
RESET='\033[0m'

# ── Helpers ───────────────────────────────────────────────────────────────────

# Resolve symlink target and check it points inside DOTFILES
is_stow_link() {
    local link="$1"
    [[ -L "$link" ]] || return 1
    local target
    target=$(readlink -f "$link" 2>/dev/null) || return 1
    [[ "$target" == "$DOTFILES"/* ]]
}

# Check whether a path in TARGET is stow-linked to a specific package
is_linked_to_pkg() {
    local link="$1"
    local pkg="$2"
    [[ -L "$link" ]] || return 1
    local target
    target=$(readlink -f "$link" 2>/dev/null) || return 1
    [[ "$target" == "$DOTFILES/$pkg/"* ]]
}

# ── Package scanner ───────────────────────────────────────────────────────────

scan_package() {
    local pkg="$1"
    local pkg_dir="$DOTFILES/$pkg"

    local total=0 linked=0 missing=0 broken=0 foreign=0
    local partial_dirs=()   # dirs where only some children are linked
    local unlinked_files=() # individual files not linked

    # Walk every file/dir that Stow would deploy from this package
    while IFS= read -r -d '' src; do
        local rel="${src#$pkg_dir/}"          # path relative to package root
        local dst="$TARGET/$rel"             # expected location in ~

        # Skip the package root itself
        [[ "$src" == "$pkg_dir" ]] && continue

        # Only consider top-level entries and files (not intermediate dirs)
        # We care about what Stow actually links: files and leaf dirs
        local depth
        depth=$(echo "$rel" | tr -cd '/' | wc -c)

        if [[ -d "$src" ]]; then
            # Stow links dirs only when the target dir does not already exist.
            # If TARGET/rel is a real dir, Stow descends into it (directory folding).
            # We report it only at depth 0 (top-level) for overview.
            [[ $depth -ne 0 ]] && continue

            if is_linked_to_pkg "$dst" "$pkg"; then
                # Entire dir is a symlink → fully linked
                ((linked++)); ((total++))
            elif [[ -d "$dst" ]] && ! [[ -L "$dst" ]]; then
                # Real dir exists → Stow descended; check children
                local ch_total=0 ch_linked=0
                while IFS= read -r -d '' child_src; do
                    local child_rel="${child_src#$pkg_dir/}"
                    local child_dst="$TARGET/$child_rel"
                    ((ch_total++))
                    is_linked_to_pkg "$child_dst" "$pkg" && ((ch_linked++))
                done < <(find "$src" -not -type d -print0 2>/dev/null)

                ((total++))
                if [[ $ch_total -eq 0 ]]; then
                    # Empty package dir
                    ((linked++))
                elif [[ $ch_linked -eq $ch_total ]]; then
                    ((linked++))
                elif [[ $ch_linked -eq 0 ]]; then
                    ((missing++))
                    unlinked_files+=("$rel/")
                else
                    ((foreign++))  # reuse 'foreign' counter for partial
                    partial_dirs+=("$rel/ ($ch_linked/$ch_total files linked)")
                fi
            elif [[ -L "$dst" ]] && ! is_linked_to_pkg "$dst" "$pkg"; then
                ((broken++)); ((total++))
            else
                ((missing++)); ((total++))
                unlinked_files+=("$rel/")
            fi
        else
            # It's a file
            ((total++))
            if is_linked_to_pkg "$dst" "$pkg"; then
                ((linked++))
            elif [[ -L "$dst" ]] && ! is_stow_link "$dst"; then
                ((broken++))   # symlink, but points elsewhere
                unlinked_files+=("$rel (→ foreign link)")
            elif [[ -e "$dst" ]]; then
                ((broken++))   # real file blocking stow
                unlinked_files+=("$rel (blocked by real file)")
            else
                ((missing++))
                unlinked_files+=("$rel")
            fi
        fi
    done < <(find "$pkg_dir" -mindepth 1 -print0 2>/dev/null)

    # ── Determine overall status ──────────────────────────────────────────────
    local status color
    if [[ $total -eq 0 ]]; then
        status="EMPTY"
        color="$DIM"
    elif [[ $linked -eq $total ]]; then
        status="LINKED"
        color="$GREEN"
    elif [[ $linked -eq 0 && $broken -eq 0 && $foreign -eq 0 ]]; then
        status="NOT LINKED"
        color="$RED"
    else
        status="PARTIAL"
        color="$YELLOW"
    fi

    # ── Print summary line ────────────────────────────────────────────────────
    printf "${color}%-20s  %-12s${RESET}  ${DIM}%d/%d files linked${RESET}\n" \
        "$pkg" "$status" "$linked" "$total"

    # ── Print details for PARTIAL / broken ───────────────────────────────────
    if [[ "$status" == "PARTIAL" ]]; then
        for d in "${partial_dirs[@]}"; do
            printf "  ${CYAN}partial dir:${RESET}  %s\n" "$d"
        done
        for f in "${unlinked_files[@]}"; do
            printf "  ${RED}not linked:${RESET}   %s\n" "$f"
        done
    fi

    if [[ $broken -gt 0 && "$status" != "PARTIAL" ]]; then
        for f in "${unlinked_files[@]}"; do
            printf "  ${YELLOW}issue:${RESET}  %s\n" "$f"
        done
    fi
}

# ── Main ──────────────────────────────────────────────────────────────────────

if [[ ! -d "$DOTFILES" ]]; then
    echo "Error: dotfiles directory not found: $DOTFILES" >&2
    exit 1
fi

echo
printf "${CYAN}Dotfiles:${RESET} %s\n" "$DOTFILES"
printf "${CYAN}Target:${RESET}   %s\n" "$TARGET"
echo
printf "${DIM}%-20s  %-12s  %s${RESET}\n" "PACKAGE" "STATUS" "DETAILS"
printf "${DIM}%s${RESET}\n" "$(printf '─%.0s' {1..55})"

for pkg_path in "$DOTFILES"/*/; do
    [[ -d "$pkg_path" ]] || continue
    pkg=$(basename "$pkg_path")
    scan_package "$pkg"
done

echo
printf "${DIM}Legend:${RESET}  "
printf "${GREEN}LINKED${RESET} all files linked  "
printf "${RED}NOT LINKED${RESET} none linked  "
printf "${YELLOW}PARTIAL${RESET} mixed  "
printf "${DIM}EMPTY${RESET} no files\n"
echo
