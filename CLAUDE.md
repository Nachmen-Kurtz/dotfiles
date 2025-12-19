# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

Personal dotfiles for a Fedora Linux system with dual X11 (i3) and Wayland (sway/hyprland) environments. Configs are organized by application and version-controlled on Codeberg (`git@codeberg.org:nachmenk/dotfiles.git`).

## Deployment

Dotfiles are managed with **GNU Stow**. Each top-level directory is a Stow package — run `stow <app>` from the repo root to symlink its contents into `$HOME`. Install scripts in `Setup_and_Install/` handle bootstrapping:

1. `1_repos_packages_install.sh` — detects distro/package manager, installs 80+ packages
2. `2_flatpak_packagas_install.sh` — installs Flatpak apps
3. `3_binerys_standalone.sh` — installs standalone binaries (Starship, OpenTofu, yt-dlp, Calibre)
4. `4_post_install.sh` — adds user to `libvirt` and `input` groups
5. `5_framworks.sh` — installs TPM (tmux), LazyVim, Doom Emacs

## Repository Structure

Each application has its own top-level directory following the pattern `<app>/.config/<app>/`. Key directories:

- `emacs/` — GNU Emacs; `init.el` is the primary config (~16k lines), uses `use-package`
- `nvim/` — Neovim; Lua-based with LazyVim plugins under `lua/plugins/`
- `fish/` — Primary shell; modular with `conf.d/`, `functions/`, `completions/`
- `sway/` — Wayland WM (primary); integrates waybar, mako, wofi, swaylock, swaync
- `i3/` — X11 WM; US+Hebrew keyboard layout via Alt+Shift, Alacritty as terminal
- `ghostty/`, `alacritty/`, `kitty/`, `wezterm/` — Terminal emulators
- `bash/`, `zsh/`, `nushell/` — Alternative shells with modular configs
- `git/` — Uses `nano` as core editor, GPG-signed commits
- `System/` — System-level configs (excluded from `.gitignore`): shell scripts, services, cron, Desktop files, D-Bus configs

## Architecture Notes

**Fish shell** is the primary interactive shell. Its config is split across:
- `conf.d/` — auto-sourced init scripts (aliases, eval hooks, starship, fzf, yt-dlp settings)
- `functions/` — fish function definitions
- `completions/` — tab completion scripts

**GNU Emacs** is the primary editor for most file types. The `init.el` is monolithic but uses `use-package` throughout. Key features: doom-themes, elfeed (RSS), mu4e (email), LSP. Font: JetBrainsMono Nerd Font at height 110.

**Git operations** are handled via **Magit** (inside Emacs). `nano` is set as the core editor only for terminal/TTY contexts where Emacs is unavailable.

**Branching convention**: date-based branches like `03-2026/fedora` for Fedora-specific snapshots.

**`.gitignore`** excludes: `System/` directory, backup files (`*~`, `*.bak`), swap files, history files, sensitive keys/certs, and `.idea/`.
