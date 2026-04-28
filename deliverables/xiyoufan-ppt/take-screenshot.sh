#!/usr/bin/env bash
set -euo pipefail

INPUT_HTML="${1:-/workspace/guizang-ppt-skill/deliverables/xiyoufan-ppt/index.html}"
OUTPUT_PNG="${2:-/workspace/guizang-ppt-skill/deliverables/xiyoufan-ppt/preview.png}"
SIZE="${3:-1600,900}"

if [[ "$INPUT_HTML" != file://* ]]; then
  INPUT_HTML="file://$INPUT_HTML"
fi

find_browser() {
  local candidates=(
    microsoft-edge
    microsoft-edge-stable
    msedge
    msedge.exe
    google-chrome
    chromium
    chromium-browser
  )

  for b in "${candidates[@]}"; do
    if command -v "$b" >/dev/null 2>&1; then
      echo "$b"
      return 0
    fi
  done
  return 1
}

BROWSER="$(find_browser || true)"

if [[ -z "$BROWSER" ]]; then
  echo "No supported browser found. Please install Microsoft Edge (recommended) or Chromium/Chrome." >&2
  exit 127
fi

"$BROWSER" \
  --headless \
  --disable-gpu \
  --screenshot="$OUTPUT_PNG" \
  --window-size="$SIZE" \
  "$INPUT_HTML"

echo "Screenshot saved to: $OUTPUT_PNG"
