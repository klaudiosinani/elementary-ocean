#!/usr/bin/env bash
set -euo pipefail

SCHEMA="io.elementary.terminal.settings"

if ! gsettings list-schemas 2>/dev/null | grep -q "^${SCHEMA}$"; then
  echo "Error: Schema '${SCHEMA}' not found."
  echo "This script is designed for Elementary OS 8.1 (Pantheon Terminal)."
  exit 1
fi

echo "Applying Elementary Ocean theme to Pantheon Terminal..."

gsettings set "${SCHEMA}" background "#0F111A"
gsettings set "${SCHEMA}" foreground "#8F93A2"
gsettings set "${SCHEMA}" cursor-color "#8F93A2"
gsettings set "${SCHEMA}" prefer-dark-style true

# Palette: 16 ANSI colors (0-15) separated by colons
# 0  Black:          #000000
# 1  Red:            #E25822
# 2  Green:          #14B37D
# 3  Yellow:         #F2F27A
# 4  Blue:           #3A75C4
# 5  Magenta:        #703FAF
# 6  Cyan:           #87D3F8
# 7  White:          #FFFFFF
# 8  Bright Black:   #333333
# 9  Bright Red:     #E25822
# 10 Bright Green:   #14B37D
# 11 Bright Yellow:  #F2F27A
# 12 Bright Blue:    #3A75C4
# 13 Bright Magenta: #703FAF
# 14 Bright Cyan:    #87D3F8
# 15 Bright White:   #F3EFE0
gsettings set "${SCHEMA}" palette "#000000:#E25822:#14B37D:#F2F27A:#3A75C4:#703FAF:#87D3F8:#FFFFFF:#333333:#E25822:#14B37D:#F2F27A:#3A75C4:#703FAF:#87D3F8:#F3EFE0"

echo "Elementary Ocean theme applied successfully."
echo "Restart Pantheon Terminal if the changes are not visible immediately."
