#!/bin/bash

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
BOLD='\033[1m'
NC='\033[0m'

print_header() {
  echo -e "${CYAN}${BOLD}============================================${NC}"
  echo -e "${CYAN}${BOLD}$1${NC}"
  echo -e "${CYAN}${BOLD}============================================${NC}"
}

print_success() {
  echo -e "${GREEN}✓ $1${NC}"
}

print_warning() {
  echo -e "${YELLOW}⚠ $1${NC}"
}

print_error() {
  echo -e "${RED}✗ $1${NC}"
}

print_info() {
  echo -e "${BLUE}→ $1${NC}"
}

print_section() {
  echo -e "${MAGENTA}${BOLD}$1${NC}"
}

detect_os() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    if [ -f /etc/os-release ]; then
      . /etc/os-release
      OS_NAME="$NAME"
      OS_VERSION="$VERSION"
      OS_ID="$ID"
    else
      OS_NAME="Linux"
      OS_VERSION="Unknown"
      OS_ID="unknown"
    fi
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    OS_NAME="macOS"
    OS_VERSION=$(sw_vers -productVersion)
    OS_ID="macos"
  else
    OS_NAME="Unknown"
    OS_VERSION="Unknown"
    OS_ID="unknown"
  fi
}

detect_package_managers() {
  AVAILABLE_PKG_MGRS=()

  if command -v dnf &>/dev/null; then AVAILABLE_PKG_MGRS+=("DNF"); fi
  if command -v apt &>/dev/null; then AVAILABLE_PKG_MGRS+=("APT"); fi
  if command -v pacman &>/dev/null; then AVAILABLE_PKG_MGRS+=("Pacman"); fi
  if command -v flatpak &>/dev/null; then AVAILABLE_PKG_MGRS+=("Flatpak"); fi
  if command -v cargo &>/dev/null; then AVAILABLE_PKG_MGRS+=("Cargo"); fi
  if command -v brew &>/dev/null; then AVAILABLE_PKG_MGRS+=("Homebrew"); fi
}

echo ""
CURRENT_DATE=$(date +"%Y-%m-%d_%H-%M-%S")

print_header "Package Management History Collection"
echo -e "${WHITE}Script started at: ${BOLD}$CURRENT_DATE${NC}"
echo ""

detect_os
detect_package_managers

print_section "System Information"
echo -e "${WHITE}Operating System: ${BOLD}$OS_NAME $OS_VERSION${NC}"
echo -e "${WHITE}OS Type: ${BOLD}$OS_ID${NC}"
echo ""

print_section "Available Package Managers"
if [ ${#AVAILABLE_PKG_MGRS[@]} -eq 0 ]; then
  print_warning "No supported package managers found!"
  exit 1
else
  for mgr in "${AVAILABLE_PKG_MGRS[@]}"; do
    echo -e "${GREEN}  ✓ $mgr${NC}"
  done
fi
echo ""

print_section "Collection Plan"
echo -e "${WHITE}The script will collect:${NC}"
for mgr in "${AVAILABLE_PKG_MGRS[@]}"; do
  case $mgr in
  "DNF")
    echo -e "${CYAN}  • DNF:${NC} Transaction history, repositories, installed packages"
    ;;
  "APT")
    echo -e "${CYAN}  • APT:${NC} Installation logs, installed packages, repositories"
    ;;
  "Pacman")
    echo -e "${CYAN}  • Pacman:${NC} Installation logs, installed packages, package database"
    ;;
  "Flatpak")
    echo -e "${CYAN}  • Flatpak:${NC} History, installed applications"
    ;;
  "Cargo")
    echo -e "${CYAN}  • Cargo:${NC} Installed Rust packages"
    ;;
  "Homebrew")
    echo -e "${CYAN}  • Homebrew:${NC} Installed packages, casks, taps"
    ;;
  esac
done
echo ""

BASE_DIR="Manage_Packages_${CURRENT_DATE}"
FLATPAK_OUTPUT="${BASE_DIR}/Flatpak"
DNF_OUTPUT="${BASE_DIR}/DNF"
APT_OUTPUT="${BASE_DIR}/APT"
PACMAN_OUTPUT="${BASE_DIR}/Pacman"
RPM_OUTPUT="${BASE_DIR}/RPM"
CARGO_OUTPUT="${BASE_DIR}/Cargo"
HOMEBREW_OUTPUT="${BASE_DIR}/Homebrew"

mkdir -p "$BASE_DIR"

for mgr in "${AVAILABLE_PKG_MGRS[@]}"; do
  case $mgr in
  "DNF") mkdir -p "$DNF_OUTPUT" "$RPM_OUTPUT" ;;
  "APT") mkdir -p "$APT_OUTPUT" ;;
  "Pacman") mkdir -p "$PACMAN_OUTPUT" ;;
  "Flatpak") mkdir -p "$FLATPAK_OUTPUT" ;;
  "Cargo") mkdir -p "$CARGO_OUTPUT" ;;
  "Homebrew") mkdir -p "$HOMEBREW_OUTPUT" ;;
  esac
done

print_success "Created directory structure in: $BASE_DIR"
echo ""

if [[ " ${AVAILABLE_PKG_MGRS[@]} " =~ " DNF " ]]; then
  print_header "Collecting DNF History"

  print_info "Running: dnf history list"
  dnf history list >"${DNF_OUTPUT}/dnf_history_list.txt" 2>&1 && print_success "DNF history list collected" || print_warning "dnf history list failed"

  print_info "Running: dnf repolist"
  dnf repolist >"${DNF_OUTPUT}/dnf_repolist.txt" 2>&1 && print_success "DNF repolist collected" || print_warning "dnf repolist failed"

  print_info "Running: dnf list --installed"
  dnf list --installed >"${DNF_OUTPUT}/dnf_list_installed.txt" 2>&1 && print_success "DNF installed packages list collected" || print_warning "dnf list installed failed"

  if [ -d /usr/lib/sysimage/libdnf5 ]; then
    print_info "Copying essential DNF database files..."
    find /usr/lib/sysimage/libdnf5 -maxdepth 2 \( -name "*.sqlite" -o -name "*.db" -o -name "*.repo" \) -exec cp {} "${DNF_OUTPUT}/" \; 2>&1 && print_success "Essential DNF database files copied" || print_warning "Some DNF files failed to copy"
  fi

  if [ -d /usr/lib/sysimage/rpm ]; then
    print_info "Copying essential RPM database files..."
    find /usr/lib/sysimage/rpm -maxdepth 1 \( -name "*.sqlite" -o -name "rpmdb.sqlite" -o -name "Packages" \) -exec cp {} "${RPM_OUTPUT}/" \; 2>&1 && print_success "Essential RPM database files copied" || print_warning "Some RPM files failed to copy"
  fi

  echo ""
fi

if [[ " ${AVAILABLE_PKG_MGRS[@]} " =~ " APT " ]]; then
  print_header "Collecting APT History"

  print_info "Running: apt list --installed"
  apt list --installed >"${APT_OUTPUT}/apt_list_installed.txt" 2>&1 && print_success "APT installed packages collected" || print_warning "apt list --installed failed"

  print_info "Copying APT history logs..."
  if [ -f /var/log/apt/history.log ]; then
    cp /var/log/apt/history.log "${APT_OUTPUT}/" 2>&1 && print_success "APT history.log copied" || print_warning "Failed to copy history.log"
  fi

  if [ -f /var/log/dpkg.log ]; then
    cp /var/log/dpkg.log "${APT_OUTPUT}/" 2>&1 && print_success "dpkg.log copied" || print_warning "Failed to copy dpkg.log"
  fi

  print_info "Running: apt-cache policy"
  apt-cache policy >"${APT_OUTPUT}/apt_cache_policy.txt" 2>&1 && print_success "APT cache policy collected" || print_warning "apt-cache policy failed"

  print_info "Copying sources.list..."
  if [ -f /etc/apt/sources.list ]; then
    cp /etc/apt/sources.list "${APT_OUTPUT}/" 2>&1 && print_success "sources.list copied" || print_warning "Failed to copy sources.list"
  fi

  if [ -d /etc/apt/sources.list.d ]; then
    cp -r /etc/apt/sources.list.d "${APT_OUTPUT}/" 2>&1 && print_success "sources.list.d copied" || print_warning "Failed to copy sources.list.d"
  fi

  echo ""
fi

if [[ " ${AVAILABLE_PKG_MGRS[@]} " =~ " Pacman " ]]; then
  print_header "Collecting Pacman History"

  print_info "Running: pacman -Q"
  pacman -Q >"${PACMAN_OUTPUT}/pacman_installed.txt" 2>&1 && print_success "Pacman installed packages collected" || print_warning "pacman -Q failed"

  print_info "Running: pacman -Qe (explicitly installed)"
  pacman -Qe >"${PACMAN_OUTPUT}/pacman_explicit.txt" 2>&1 && print_success "Explicitly installed packages collected" || print_warning "pacman -Qe failed"

  print_info "Running: pacman -Qm (foreign packages)"
  pacman -Qm >"${PACMAN_OUTPUT}/pacman_foreign.txt" 2>&1 && print_success "Foreign packages collected" || print_warning "pacman -Qm failed"

  print_info "Copying pacman log..."
  if [ -f /var/log/pacman.log ]; then
    cp /var/log/pacman.log "${PACMAN_OUTPUT}/" 2>&1 && print_success "pacman.log copied" || print_warning "Failed to copy pacman.log"
  fi

  print_info "Copying mirrorlist..."
  if [ -f /etc/pacman.d/mirrorlist ]; then
    cp /etc/pacman.d/mirrorlist "${PACMAN_OUTPUT}/" 2>&1 && print_success "mirrorlist copied" || print_warning "Failed to copy mirrorlist"
  fi

  echo ""
fi

if [[ " ${AVAILABLE_PKG_MGRS[@]} " =~ " Flatpak " ]]; then
  print_header "Collecting Flatpak History"

  print_info "Running: flatpak history"
  flatpak history >"${FLATPAK_OUTPUT}/flatpak_history.txt" 2>&1 && print_success "Flatpak history collected" || print_warning "flatpak history failed"

  print_info "Running: flatpak list --app"
  flatpak list --app >"${FLATPAK_OUTPUT}/flatpak_list_apps.txt" 2>&1 && print_success "Flatpak apps list collected" || print_warning "flatpak list --app failed"

  print_info "Running: flatpak list"
  flatpak list >"${FLATPAK_OUTPUT}/flatpak_list_all.txt" 2>&1 && print_success "Complete Flatpak list collected" || print_warning "flatpak list failed"

  print_info "Running: flatpak remotes"
  flatpak remotes >"${FLATPAK_OUTPUT}/flatpak_remotes.txt" 2>&1 && print_success "Flatpak remotes collected" || print_warning "flatpak remotes failed"

  echo ""
fi

if [[ " ${AVAILABLE_PKG_MGRS[@]} " =~ " Cargo " ]]; then
  print_header "Collecting Cargo Information"

  print_info "Running: cargo install --list"
  cargo install --list >"${CARGO_OUTPUT}/cargo_install_list.txt" 2>&1 && print_success "Cargo installed packages collected" || print_warning "cargo install --list failed"

  echo ""
fi

if [[ " ${AVAILABLE_PKG_MGRS[@]} " =~ " Homebrew " ]]; then
  print_header "Collecting Homebrew Information"

  print_info "Running: brew list"
  brew list >"${HOMEBREW_OUTPUT}/brew_list.txt" 2>&1 && print_success "Homebrew packages collected" || print_warning "brew list failed"

  print_info "Running: brew list --cask"
  brew list --cask >"${HOMEBREW_OUTPUT}/brew_list_cask.txt" 2>&1 && print_success "Homebrew casks collected" || print_warning "brew list --cask failed"

  print_info "Running: brew leaves"
  brew leaves >"${HOMEBREW_OUTPUT}/brew_leaves.txt" 2>&1 && print_success "Homebrew leaves collected" || print_warning "brew leaves failed"

  print_info "Running: brew tap"
  brew tap >"${HOMEBREW_OUTPUT}/brew_tap.txt" 2>&1 && print_success "Homebrew taps collected" || print_warning "brew tap failed"

  print_info "Running: brew info --json=v2 --installed"
  brew info --json=v2 --installed >"${HOMEBREW_OUTPUT}/brew_info.json" 2>&1 && print_success "Homebrew info collected" || print_warning "brew info failed"

  echo ""
fi

print_header "Collection Complete"
echo -e "${WHITE}Date: ${BOLD}$CURRENT_DATE${NC}"
echo -e "${WHITE}Output directory: ${BOLD}$BASE_DIR${NC}"
echo ""

print_section "Directory Structure"
if command -v tree &>/dev/null; then
  tree -L 2 "$BASE_DIR"
else
  find "$BASE_DIR" -type d | sed 's|[^/]*/| |g'
fi
echo ""

print_section "Collected Files Summary"
FILE_COUNT=$(find "$BASE_DIR" -type f | wc -l)
echo -e "${WHITE}Total files collected: ${BOLD}$FILE_COUNT${NC}"
echo ""
print_info "File details:"
find "$BASE_DIR" -type f -exec ls -lh {} \; | awk -v green="$GREEN" -v nc="$NC" '{printf "  %s (%s)\n", $9, $5}'
echo ""

print_section "Storage Usage"
TOTAL_SIZE=$(du -sh "$BASE_DIR" | awk '{print $1}')
echo -e "${WHITE}Total size: ${BOLD}$TOTAL_SIZE${NC}"
echo ""

print_success "Package management data collection completed successfully!"
echo ""

exit 0
