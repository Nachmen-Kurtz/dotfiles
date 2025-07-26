# Quick file backup function
# Usage: bkp <filename>
function bkp() {
  cp -a "$1" "$1.bak"
}
