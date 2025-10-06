#!/bin/bash

set -e

echo "=== Building and Starting Hugo Development Server ==="

./hugo-build.sh

echo "Starting Hugo server..."
cd doc-site
hugo server
