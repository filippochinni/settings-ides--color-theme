#!/usr/bin/env sh
set -eu

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
TARGET="$(cd "${1:-$PWD}" && pwd)"

if [ "$TARGET" = "$ROOT" ]; then
  echo "Errore: il target non può essere la root del repo" >&2
  exit 1
fi

for f in README.md CHANGELOG.md LICENSE.md; do
  cp "$ROOT/$f" "$TARGET/$f"
done

rm -rf "$TARGET/_shared"
cp -r "$ROOT/_shared" "$TARGET/_shared"
