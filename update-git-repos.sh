#!/bin/bash

set -e

echo "Updating Hugo project and theme..."

# Clean up previous temp clones
rm -rf .git_temp/hugo
rm -rf .git_temp/hugo-theme-techdoc

echo "Cloning Hugo..."
git clone https://github.com/gohugoio/hugo.git .git_temp/hugo

echo "Cloning hugo-theme-techdoc theme..."
git clone https://github.com/thingsym/hugo-theme-techdoc.git .git_temp/hugo-theme-techdoc

echo "Copying Hugo files to doc-site..."
rsync -av --exclude='.git' .git_temp/hugo/ doc-site/

echo "Copying theme to doc-site/themes/..."
rsync -av --exclude='.git' .git_temp/hugo-theme-techdoc/ doc-site/themes/hugo-theme-techdoc/

echo "Update complete!"
echo ""
