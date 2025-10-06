#!/bin/bash

# Script to convert draw.io files to SVG and build Hugo site

set -e

echo "=== Hugo Build Script ==="

echo "Preparing Hugo site content..."
cd doc-site
hugo build
cd ..
echo "✓ Preparing complete"
echo ""

# Get the path of drawio CLI binary - abort and provide install instructions if not available
DRAWIO_CMD=""
for dir in /usr/bin /usr/local/bin /opt/homebrew/bin /Applications/draw.io.app/Contents/MacOS; do
  for cmd in drawio draw.io; do
    if [ -f "$dir/$cmd" ]; then
      DRAWIO_CMD="$dir/$cmd"
      break 2
    fi
  done
done
if [ -z "$DRAWIO_CMD" ]; then
    echo "✗ draw.io CLI not found"
    echo ""
    echo "Please install draw.io to convert diagram files:"
    echo "  macOS:   brew install --cask drawio"
    echo "  Linux:   Download from https://github.com/jgraph/drawio-desktop/releases"
    echo "  Windows: Go to hell!"
    echo ""
    exit 1
fi

# Convert all .drawio files to .svg
DRAWIO_FILES=$(find doc-site/public/images -name "*.drawio" 2>/dev/null || true)
if [ -n "$DRAWIO_FILES" ]; then
    echo "Converting draw.io files to SVG..."
    while IFS= read -r file; do
        echo "  - Converting: $file"
        "$DRAWIO_CMD" --export --format svg --output "${file%.drawio}.svg" "$file"
    done <<< "$DRAWIO_FILES"
    echo "✓ draw.io files converted"
    echo ""
else
    echo "⚠ No .drawio files found in doc-site/static/images"
    echo ""
fi

echo "Updating image references in Markdown files (if any)..."
find doc-site/content -name "*.md" -exec sed -i '' 's/\.drawio)/\.svg)/g' {} \;
echo "✓ Image references updated - if any"
echo ""

echo ""
