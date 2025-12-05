#!/bin/bash

# Color output for readability
info() { echo -e "\033[0;34m→\033[0m $1"; }
success() { echo -e "\033[0;32m✓\033[0m $1"; }
error() { echo -e "\033[0;31m✗\033[0m $1"; }

echo ""
echo "Removing dotfile symlinks..."
echo ""

# Unlink function - only removes if it's a symlink
unlink_if_symlink() {
    local path="$1"

    if [ -L "$path" ]; then
        rm "$path"
        success "Unlinked: $path"
    elif [ -e "$path" ]; then
        info "$path exists but is not a symlink, skipping"
    else
        info "$path doesn't exist, skipping"
    fi
}

# Remove all symlinks
unlink_if_symlink "$HOME/.zshrc"
unlink_if_symlink "$HOME/.config/nvim"
unlink_if_symlink "$HOME/.config/gh"
unlink_if_symlink "$HOME/.gitconfig"
unlink_if_symlink "$HOME/.gitignore_global"
unlink_if_symlink "$HOME/.gitmessage"

echo ""
echo "Done! Your dotfiles are unlinked."
echo ""
