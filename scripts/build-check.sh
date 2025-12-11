#!/bin/bash
# Build with type checking
# Equivalent to: just build-check

set -e

source "$(dirname "$0")/common.sh"

print_status "Running type check..."
bun run check

print_status "Building extension..."
bun run build

print_success "Build complete with type checking!"
