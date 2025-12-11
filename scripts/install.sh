#!/bin/bash
# Install dependencies
# Equivalent to: just install

set -e

source "$(dirname "$0")/common.sh"

print_status "Installing dependencies..."
bun install
print_success "Dependencies installed!"
