#!/bin/bash

# Multi-site search script
# Usage: search-so "your query" or search-yt "your query" etc.

# Color definitions
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

# Function to URL encode the search query
urlencode() {
  local string="${1}"
  local strlen=${#string}
  local encoded=""
  local pos c o

  for ((pos = 0; pos < strlen; pos++)); do
    c=${string:$pos:1}
    case "$c" in
    [-_.~a-zA-Z0-9]) o="${c}" ;;
    *) printf -v o '%%%02x' "'$c" ;;
    esac
    encoded+="${o}"
  done
  echo "${encoded}"
}

# Get the script name to determine which site to search
SCRIPT_NAME=$(basename "$0")

# Check if query is provided
if [ -z "$1" ]; then
  echo -e "${RED}${BOLD}Error:${RESET} ${YELLOW}No search query provided!${RESET}"
  echo -e "${CYAN}Usage:${RESET} $SCRIPT_NAME ${GREEN}\"your search query\"${RESET}"
  exit 1
fi

# URL encode the search query
QUERY=$(urlencode "$*")

# Determine the search URL based on script name
case "$SCRIPT_NAME" in
# Development & Programming
search-so)
  URL="https://www.google.com/search?q=${QUERY}+site:stackoverflow.com"
  SITE_NAME="${YELLOW}Stack Overflow${RESET}"
  ;;
search-sf)
  URL="https://www.google.com/search?q=${QUERY}+site:serverfault.com"
  SITE_NAME="${YELLOW}Server Fault${RESET}"
  ;;
search-su)
  URL="https://www.google.com/search?q=${QUERY}+site:superuser.com"
  SITE_NAME="${YELLOW}Super User${RESET}"
  ;;
search-se)
  URL="https://www.google.com/search?q=${QUERY}+site:stackexchange.com"
  SITE_NAME="${YELLOW}Stack Exchange${RESET}"
  ;;
search-gh)
  URL="https://github.com/search?q=${QUERY}&type=repositories"
  SITE_NAME="${MAGENTA}GitHub${RESET}"
  ;;
search-gist)
  URL="https://gist.github.com/search?q=${QUERY}"
  SITE_NAME="${MAGENTA}GitHub Gist${RESET}"
  ;;

# Documentation
search-mdn)
  URL="https://www.google.com/search?q=${QUERY}+site:developer.mozilla.org"
  SITE_NAME="${BLUE}MDN Web Docs${RESET}"
  ;;
search-godocs)
  URL="https://pkg.go.dev/search?q=${QUERY}"
  SITE_NAME="${CYAN}Go Docs${RESET}"
  ;;
search-rustdocs)
  URL="https://docs.rs/releases/search?query=${QUERY}"
  SITE_NAME="${RED}Rust Docs${RESET}"
  ;;
search-pydocs)
  URL="https://docs.python.org/3/search.html?q=${QUERY}"
  SITE_NAME="${BLUE}Python Docs${RESET}"
  ;;
search-aws)
  URL="https://www.google.com/search?q=${QUERY}+site:docs.aws.amazon.com"
  SITE_NAME="${YELLOW}AWS Documentation${RESET}"
  ;;
search-man)
  URL="https://man7.org/cgi-bin/man-cgi?${QUERY}"
  SITE_NAME="${GREEN}man7.org${RESET}"
  ;;
search-docs)
  URL="https://devdocs.io/#q=${QUERY}"
  SITE_NAME="${BLUE}DevDocs${RESET}"
  ;;

# Package Managers
search-npm)
  URL="https://www.npmjs.com/search?q=${QUERY}"
  SITE_NAME="${RED}npm${RESET}"
  ;;
search-pypi)
  URL="https://pypi.org/search/?q=${QUERY}"
  SITE_NAME="${BLUE}PyPI${RESET}"
  ;;
search-nixpkgs)
  URL="https://search.nixos.org/packages?query=${QUERY}"
  SITE_NAME="${BLUE}NixPkgs${RESET}"
  ;;
search-archpkg)
  URL="https://archlinux.org/packages/?q=${QUERY}"
  SITE_NAME="${CYAN}Arch Packages${RESET}"
  ;;
search-fedorapkg)
  URL="https://packages.fedoraproject.org/search?query=${QUERY}"
  SITE_NAME="${BLUE}Fedora Packages${RESET}"
  ;;

# Linux Wikis & Documentation
search-archwiki)
  URL="https://wiki.archlinux.org/index.php?search=${QUERY}"
  SITE_NAME="${CYAN}Arch Wiki${RESET}"
  ;;
search-gentoowiki)
  URL="https://wiki.gentoo.org/index.php?search=${QUERY}"
  SITE_NAME="${MAGENTA}Gentoo Wiki${RESET}"
  ;;
search-debianwiki)
  URL="https://wiki.debian.org/FrontPage?action=fullsearch&value=${QUERY}"
  SITE_NAME="${RED}Debian Wiki${RESET}"
  ;;
search-nixwiki)
  URL="https://wiki.nixos.org/w/index.php?search=${QUERY}"
  SITE_NAME="${BLUE}NixOS Wiki${RESET}"
  ;;
search-susewiki)
  URL="https://en.opensuse.org/index.php?search=${QUERY}"
  SITE_NAME="${GREEN}openSUSE Wiki${RESET}"
  ;;
search-voiddocs)
  URL="https://docs.voidlinux.org/search.html?q=${QUERY}"
  SITE_NAME="${GREEN}Void Docs${RESET}"
  ;;
search-voidwiki)
  URL="https://www.google.com/search?q=${QUERY}+site:voidlinux.org"
  SITE_NAME="${GREEN}Void Wiki${RESET}"
  ;;
search-fedoradocs)
  URL="https://docs.fedoraproject.org/en-US/search/?query=${QUERY}"
  SITE_NAME="${BLUE}Fedora Docs${RESET}"
  ;;
search-linuxwiki)
  URL="https://www.google.com/search?q=${QUERY}+site:wiki.archlinux.org+OR+site:wiki.gentoo.org+OR+site:wiki.debian.org+OR+site:wiki.nixos.org+OR+site:en.opensuse.org"
  SITE_NAME="${BOLD}${GREEN}All Linux Wikis${RESET}"
  ;;

# Social & Media
search-yt)
  URL="https://www.youtube.com/results?search_query=${QUERY}"
  SITE_NAME="${RED}YouTube${RESET}"
  ;;
search-reddit)
  URL="https://www.google.com/search?q=${QUERY}+site:reddit.com"
  SITE_NAME="${RED}Reddit${RESET}"
  ;;
search-wiki)
  URL="https://en.wikipedia.org/w/index.php?search=${QUERY}"
  SITE_NAME="${BLUE}Wikipedia${RESET}"
  ;;

# AI & Search Engines
search-chatgpt)
  URL="https://chat.openai.com/?q=${QUERY}"
  SITE_NAME="${GREEN}ChatGPT${RESET}"
  ;;
search-perplexity)
  URL="https://www.perplexity.ai/search?q=${QUERY}"
  SITE_NAME="${CYAN}Perplexity${RESET}"
  ;;
search-claude)
  URL="https://claude.ai/new?q=${QUERY}"
  SITE_NAME="${YELLOW}Claude${RESET}"
  ;;
search-ddg)
  URL="https://duckduckgo.com/?q=${QUERY}"
  SITE_NAME="${RED}DuckDuckGo${RESET}"
  ;;

*)
  echo -e "${RED}${BOLD}Error:${RESET} Unknown command: ${YELLOW}$SCRIPT_NAME${RESET}"
  echo ""
  echo -e "${CYAN}${BOLD}Available commands:${RESET}"
  echo -e "  ${MAGENTA}Development:${RESET} search-so, search-sf, search-su, search-se, search-gh, search-gist"
  echo -e "  ${BLUE}Documentation:${RESET} search-mdn, search-godocs, search-rustdocs, search-pydocs, search-aws, search-man, search-docs"
  echo -e "  ${GREEN}Packages:${RESET} search-npm, search-pypi, search-nixpkgs, search-archpkg, search-fedorapkg"
  echo -e "  ${CYAN}Linux Wikis:${RESET} search-archwiki, search-gentoowiki, search-debianwiki, search-nixwiki, search-susewiki"
  echo -e "  ${GREEN}Linux Docs:${RESET} search-voiddocs, search-voidwiki, search-fedoradocs, search-linuxwiki"
  echo -e "  ${RED}Social/Media:${RESET} search-yt, search-reddit, search-wiki"
  echo -e "  ${YELLOW}AI/Search:${RESET} search-chatgpt, search-perplexity, search-claude, search-ddg"
  exit 1
  ;;
esac

# Open URL in default browser
if command -v xdg-open >/dev/null; then
  xdg-open "$URL" 2>/dev/null
elif command -v open >/dev/null; then
  open "$URL"
else
  echo -e "${RED}${BOLD}Error:${RESET} Could not detect the web browser to use."
  echo -e "${CYAN}URL:${RESET} $URL"
  exit 1
fi

echo -e "${GREEN}✓${RESET} Searching ${SITE_NAME} for: ${BOLD}${CYAN}$*${RESET}"
