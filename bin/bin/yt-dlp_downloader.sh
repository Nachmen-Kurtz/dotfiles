#!/bin/bash

# YT-DLP Batch Downloader Script
# Usage: ./script.sh <batch_file> [download_location]

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if yt-dlp is installed
if ! command -v yt-dlp &>/dev/null; then
  echo ""
  echo -e "${RED}Error: yt-dlp is not installed. Please install it first.${NC}"
  echo "Install with: pip install yt-dlp"
  exit 1
fi

# Check arguments
if [ $# -lt 1 ]; then
  echo ""
  echo -e "${RED}Usage: $0 <batch_file> [download_location]${NC}"
  echo "Example: $0 urls.txt /home/user/Videos"
  exit 1
fi

BATCH_FILE="$1"
DOWNLOAD_DIR="${2:-.}" # Use current directory if not provided

# Check if batch file exists
if [ ! -f "$BATCH_FILE" ]; then
  echo ""
  echo -e "${RED}Error: Batch file '$BATCH_FILE' not found!${NC}"
  exit 1
fi

# Create download directory if it doesn't exist
if [ ! -d "$DOWNLOAD_DIR" ]; then
  mkdir -p "$DOWNLOAD_DIR"
  echo ""
  echo -e "${YELLOW}Created download directory: $DOWNLOAD_DIR${NC}"
fi

# Read batch file and count non-empty lines
mapfile -t URLS < <(grep -v '^[[:space:]]*$' "$BATCH_FILE")
TOTAL_COUNT=${#URLS[@]}

echo ""
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}   YT-DLP Batch Downloader Started${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo -e "${YELLOW}Batch file:${NC} $BATCH_FILE"
echo -e "${YELLOW}Download location:${NC} $DOWNLOAD_DIR"
echo -e "${YELLOW}Total URLs found:${NC} $TOTAL_COUNT"
echo ""

# Preview first few records
echo -e "${BLUE}Preview of records:${NC}"
PREVIEW_COUNT=$((TOTAL_COUNT < 3 ? TOTAL_COUNT : 3))
for i in $(seq 0 $((PREVIEW_COUNT - 1))); do
  echo -e "  ${GREEN}[$((i + 1))]${NC} ${URLS[$i]}"
done
if [ $TOTAL_COUNT -gt 3 ]; then
  echo "  ..."
fi
echo ""

read -p "Press Enter to start downloading..."
echo ""

# Arrays to store results
declare -a SUCCESSFUL_DOWNLOADS
declare -a FAILED_DOWNLOADS
SUCCESS_COUNT=0
FAIL_COUNT=0

# Temporary file for storing remaining URLs
TEMP_FILE="${BATCH_FILE}.tmp"
rm -f "$TEMP_FILE"

# Process each URL
for i in "${!URLS[@]}"; do
  URL="${URLS[$i]}"

  # Skip empty lines
  if [ -z "$URL" ]; then
    continue
  fi

  # Validate URL format
  if [[ ! "$URL" =~ ^https?:// ]]; then
    echo -e "${RED}[$(date '+%H:%M:%S')] Skipping [$((i + 1))/$TOTAL_COUNT]: Invalid URL format - $URL${NC}"
    echo -e "${YELLOW}   URLs must start with http:// or https://${NC}"
    FAILED_DOWNLOADS+=("$URL")
    ((FAIL_COUNT++))
    echo "$URL" >>"$TEMP_FILE"
    echo ""
    continue
  fi

  echo -e "${BLUE}[$(date '+%H:%M:%S')]${NC} Processing [$((i + 1))/$TOTAL_COUNT]: $URL"

  # Try to download
  yt-dlp \
    --no-playlist \
    --output "$DOWNLOAD_DIR/%(title)s.%(ext)s" \
    --no-mtime \
    --progress \
    --write-description \
    "$URL" 2>&1

  STATUS=$?

  if [ $STATUS -eq 0 ]; then
    # Get titles (handles single videos and playlists)
    mapfile -t TITLES < <(yt-dlp --get-title "$URL" 2>/dev/null)

    # Fallback if no title was returned
    if [ ${#TITLES[@]} -eq 0 ]; then
      TITLES=("Unknown Title")
    fi

    echo ""
    if [ ${#TITLES[@]} -eq 1 ]; then
      echo -e "${GREEN}✓ Success:${NC} ${TITLES[0]}"
    else
      echo -e "${GREEN}✓ Success:${NC} Downloaded ${#TITLES[@]} items:"
      for t in "${TITLES[@]}"; do
        echo "   - $t"
      done
    fi

    # Store each title as its own entry
    for t in "${TITLES[@]}"; do
      SUCCESSFUL_DOWNLOADS+=("TITLE::${t}||LOCATION::${DOWNLOAD_DIR}")
    done

    ((SUCCESS_COUNT += ${#TITLES[@]}))
    echo ""
  else
    echo ""
    echo -e "${RED}✗ Failed: Could not download from $URL${NC}"
    FAILED_DOWNLOADS+=("$URL")
    ((FAIL_COUNT++))
    # Keep this URL in the batch file for retry
    echo "$URL" >>"$TEMP_FILE"
    echo ""
  fi
done

# Update batch file - remove successful downloads
if [ $SUCCESS_COUNT -gt 0 ]; then
  if [ -f "$TEMP_FILE" ]; then
    mv "$TEMP_FILE" "$BATCH_FILE"
    echo ""
    echo -e "${YELLOW}Updated batch file: Removed successfully downloaded URLs${NC}"
  else
    # All downloads successful - clear the file
    >"$BATCH_FILE"
    echo -e "${YELLOW}All downloads successful! Batch file cleared.${NC}"
  fi
else
  # Clean up temp file if no successes
  rm -f "$TEMP_FILE"
fi

# Final Summary
echo ""
echo -e "${BLUE}========================================${NC}"
echo -e "${BLUE}          Download Summary${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""
echo -e "${YELLOW}Total URLs:${NC} $TOTAL_COUNT"
echo -e "${GREEN}Successfully downloaded items:${NC} $SUCCESS_COUNT"
echo -e "${RED}Failed URLs:${NC} $FAIL_COUNT"
echo ""

# Display successful downloads
if [ $SUCCESS_COUNT -gt 0 ]; then
  echo ""
  echo -e "${GREEN}Successfully Downloaded:${NC}"
  for entry in "${SUCCESSFUL_DOWNLOADS[@]}"; do
    # Extract title and location using pattern matching
    TITLE="${entry#*TITLE::}"
    TITLE="${TITLE%%||LOCATION::*}"
    LOCATION="${entry#*LOCATION::}"

    echo -e "  ${GREEN}✓${NC} $TITLE"
    echo -e "    ${BLUE}Location:${NC} $LOCATION"
  done
  echo ""
fi

# Display failed downloads
if [ $FAIL_COUNT -gt 0 ]; then
  echo ""
  echo -e "${RED}Failed Downloads (Try again later):${NC}"
  for URL in "${FAILED_DOWNLOADS[@]}"; do
    echo -e "  ${RED}✗${NC} $URL"
    echo -e "    ${YELLOW}Status:${NC} Failed - Please retry later"
  done
  echo ""
fi

echo -e "${BLUE}========================================${NC}"
echo -e "${GREEN}Enjoy watching and fruitful learning!${NC}"
echo -e "${BLUE}========================================${NC}"
echo ""

exit 0
