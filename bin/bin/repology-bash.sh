#!/bin/bash

# Repology Package Search CLI Tool
# Usage: ./repology-bash <command> [options]

REPOLOGY_API="https://repology.org/api/v1"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to display usage
show_usage() {
  echo "Usage: $0 <command> [options]"
  echo ""
  echo "Commands:"
  echo "  search <keyword> [repo|package]    Search for packages by keyword"
  echo "                                      Optional: specify 'repo' or 'package' filter"
  echo "  query <package-name> [--distro <name>]  Get detailed info for a specific package"
  echo "                                           Optional: filter by distribution"
  echo "  show <package-name>                Show package general information"
  echo "                                      (current, outdated, legacy versions)"
  echo ""
  echo "Examples:"
  echo "  $0 search python"
  echo "  $0 search python repo"
  echo "  $0 query firefox --distro arch"
  echo "  $0 show vim"
}

# Function to search packages by keyword
search_packages() {
  local keyword="$1"
  local filter="$2"

  if [ -z "$keyword" ]; then
    echo -e "${RED}Error: Keyword required for search${NC}"
    return 1
  fi

  local filter_text=""
  if [ "$filter" = "repo" ]; then
    filter_text=" (filtering by repo)"
  elif [ "$filter" = "package" ]; then
    filter_text=" (filtering by package)"
  fi

  echo -e "${BLUE}Searching for packages with keyword: ${keyword}${filter_text}${NC}"
  echo ""

  # Search in project names using the projects API
  local url="${REPOLOGY_API}/projects/?search=${keyword}&inrepo=&notinrepo=&repos=&families=&repos_newest=&families_newest=&repos_oldest=&families_oldest=&repos_problematic=&families_problematic=&maintainer=&category=&limit=20"

  local response=$(curl -s "$url")

  if [ $? -ne 0 ]; then
    echo -e "${RED}Error: Failed to connect to Repology API${NC}"
    return 1
  fi

  # Parse and display results
  echo "$response" | jq -r 'keys[] as $k | "\($k)"' 2>/dev/null | while read -r pkg; do
    echo -e "${GREEN}• ${pkg}${NC}"
  done

  if [ "${PIPESTATUS[1]}" -ne 0 ]; then
    echo -e "${RED}Error: Failed to parse response. Make sure jq is installed.${NC}"
    return 1
  fi
}

# Function to query specific package details
query_package() {
  local package="$1"
  local distro=""

  # Parse --distro option
  shift
  while [ $# -gt 0 ]; do
    case "$1" in
    --distro)
      distro="$2"
      shift 2
      ;;
    *)
      shift
      ;;
    esac
  done

  if [ -z "$package" ]; then
    echo -e "${RED}Error: Package name required${NC}"
    return 1
  fi

  local distro_text=""
  if [ -n "$distro" ]; then
    distro_text=" (filtering by distro: ${distro})"
  fi

  echo -e "${BLUE}Querying package: ${package}${distro_text}${NC}"
  echo ""

  local url="${REPOLOGY_API}/project/${package}"
  local response=$(curl -s "$url")

  if [ $? -ne 0 ]; then
    echo -e "${RED}Error: Failed to connect to Repology API${NC}"
    return 1
  fi

  # Check if package exists
  if echo "$response" | grep -q "Project not found"; then
    echo -e "${RED}Package '${package}' not found${NC}"
    return 1
  fi

  # Display package information with optional distro filter
  if [ -n "$distro" ]; then
    echo "$response" | jq -r --arg distro "$distro" '.[] | select(.repo | contains($distro)) | "Repo: \(.repo)\nVersion: \(.version)\nStatus: \(.status)\n---"' 2>/dev/null
  else
    echo "$response" | jq -r '.[] | "Repo: \(.repo)\nVersion: \(.version)\nStatus: \(.status)\n---"' 2>/dev/null
  fi

  if [ "${PIPESTATUS[1]}" -ne 0 ]; then
    echo -e "${RED}Error: Failed to parse response${NC}"
    return 1
  fi
}

# Function to show package information (similar to query but formatted differently)
show_package() {
  local package="$1"

  if [ -z "$package" ]; then
    echo -e "${RED}Error: Package name required${NC}"
    return 1
  fi

  echo -e "${BLUE}Package Information: ${package}${NC}"
  echo ""

  local url="${REPOLOGY_API}/project/${package}"
  local response=$(curl -s "$url")

  if [ $? -ne 0 ]; then
    echo -e "${RED}Error: Failed to connect to Repology API${NC}"
    return 1
  fi

  # Check if package exists
  if echo "$response" | grep -q "Project not found"; then
    echo -e "${RED}Package '${package}' not found${NC}"
    return 1
  fi

  # Collect and categorize versions
  echo -e "${GREEN}=== General Information ===${NC}\n"

  # Get newest (current) version
  local newest=$(echo "$response" | jq -r '[.[] | select(.status == "newest")] | if length > 0 then .[0].version else "N/A" end' 2>/dev/null)
  echo -e "${YELLOW}Current Version:${NC} $newest"

  # Get outdated versions
  local outdated=$(echo "$response" | jq -r '[.[] | select(.status == "outdated")] | if length > 0 then .[0].version else "N/A" end' 2>/dev/null)
  echo -e "${YELLOW}Outdated Version:${NC} $outdated"

  # Get legacy versions
  local legacy=$(echo "$response" | jq -r '[.[] | select(.status == "legacy")] | if length > 0 then .[0].version else "N/A" end' 2>/dev/null)
  echo -e "${YELLOW}Legacy Version:${NC} $legacy"

  # Count repositories
  local repo_count=$(echo "$response" | jq -r 'length' 2>/dev/null)
  echo -e "${YELLOW}Available in:${NC} $repo_count repositories"

  echo ""
  echo -e "${GREEN}=== Repository Details ===${NC}\n"

  # Display formatted package information
  echo "$response" | jq -r '.[] | "Repository: \(.repo)\nVersion: \(.version)\nStatus: \(.status)\nVisiblename: \(.visiblename // "N/A")\n"' 2>/dev/null

  if [ "${PIPESTATUS[1]}" -ne 0 ]; then
    echo -e "${RED}Error: Failed to parse response${NC}"
    return 1
  fi
}

# Main script logic
main() {
  # Check if jq is installed
  if ! command -v jq &>/dev/null; then
    echo -e "${YELLOW}Warning: 'jq' is not installed. JSON parsing may not work properly.${NC}"
    echo "Install jq: sudo apt install jq (Debian/Ubuntu) or brew install jq (macOS)"
    echo ""
  fi

  if [ $# -eq 0 ]; then
    show_usage
    exit 1
  fi

  local command="$1"
  shift

  case "$command" in
  search)
    search_packages "$@"
    ;;
  query)
    query_package "$@"
    ;;
  show)
    show_package "$@"
    ;;
  -h | --help | help)
    show_usage
    ;;
  *)
    echo -e "${RED}Unknown command: $command${NC}"
    echo ""
    show_usage
    exit 1
    ;;
  esac
}

# Run main function
main "$@"
