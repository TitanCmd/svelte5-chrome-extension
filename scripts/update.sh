#!/bin/bash
# Update dependencies
# Equivalent to: just update

set -e

source "$(dirname "$0")/common.sh"

print_status "Updating dependencies..."
bun update
print_success "Dependencies updated!"
