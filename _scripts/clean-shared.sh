#!/usr/bin/env sh
set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"

for ext in "Visual Studio Code" "Jetbrains"; do
  TARGET="$ROOT/$ext"

  if [ ! -d "$TARGET" ]; then
    continue
  fi

  rm -f "$TARGET/README.md" "$TARGET/CHANGELOG.md" "$TARGET/LICENSE.md"
  rm -rf "$TARGET/_shared"
done
