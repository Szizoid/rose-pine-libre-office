#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SRC="$SCRIPT_DIR/src"
DIST="$SCRIPT_DIR/dist"

mkdir -p "$DIST"

for variant in main moon dawn; do
    src_dir="$SRC/$variant"
    out="$DIST/rose-pine-${variant}.oxt"

    (cd "$src_dir" && zip -r "$out" . -x "*.DS_Store")
    echo "Built: $out"
done

echo "Done. Install via: Tools → Extension Manager → Add"
