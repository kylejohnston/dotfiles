#!/bin/bash

DOTFILES="$HOME/.dotfiles"

# Color output for readability
info() { echo -e "\033[0;34m→\033[0m $1"; }
success() { echo -e "\033[0;32m✓\033[0m $1"; }
error() { echo -e "\033[0;31m✗\033[0m $1"; }

echo ""
echo "Creating symlinks for dotfiles..."
echo ""

# Link function with safety checks
link() {
    local src="$1"
    local dest="$2"

    # Check if source exists
    if [ ! -e "$src" ]; then
        error "Source doesn't exist: $src"
        return 1
    fi

    # Check if destination is already a symlink pointing to the right place
    if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
        info "Already linked: $dest → $src"
        return 0
    fi

    # Check if destination is a symlink pointing elsewhere
    if [ -L "$dest" ]; then
        error "$dest is a symlink to $(readlink "$dest"), not $src"
        return 1
    fi

    # Check if destination exists but isn't a symlink
    if [ -e "$dest" ]; then
        error "$dest exists but isn't a symlink. Please backup and remove manually."
        return 1
    fi

    # Create parent directory if it doesn't exist
    mkdir -p "$(dirname "$dest")"

    # Create the symlink
    ln -s "$src" "$dest"
    success "Linked: $dest → $src"
}

# Create all symlinks
link "$DOTFILES/zsh/.zshrc" "$HOME/.zshrc"
link "$DOTFILES/nvim" "$HOME/.config/nvim"
link "$DOTFILES/gh" "$HOME/.config/gh"
link "$DOTFILES/git/gitconfig" "$HOME/.gitconfig"
link "$DOTFILES/git/gitignore_global" "$HOME/.gitignore_global"
link "$DOTFILES/git/gitmessage" "$HOME/.gitmessage"

echo ""
echo "Done! Don't forget to create ~/.config/.gitconfig.local with your sensitive info."
echo "See README.md for template."
echo ""
