# Dotfiles Reorganization Design

**Date:** 2025-12-04
**Goal:** Reorganize dotfiles using grouped-by-app structure with manual symlink scripts

## Overview

Reorganize `~/.dotfiles/` to use a clean, grouped-by-app directory structure with separate scripts for system setup (`install.sh`) and dotfile linking (`link.sh`, `unlink.sh`).

## Current State

**In `~/.dotfiles/`:**
- `.zshrc`, `aliases.zsh` (zsh configs)
- `gitconfig`, `gitignore`, `gitignore_global`, `gitmessage` (git configs)
- `nvim/` (outdated - to be removed)
- `Brewfile`, `.macos`, `install.sh`

**In `~/.config/`:**
- `nvim/` (active Neovim config)
- `gh/` (GitHub CLI config)
- `.gitconfig.local` (sensitive git config)

**Issues:**
- Duplicate nvim directories (old in dotfiles, active in ~/.config/)
- No systematic symlink management
- Git configs scattered
- install.sh mixes system setup with dotfile linking

## Proposed Structure

```
~/.dotfiles/
├── zsh/
│   ├── .zshrc
│   └── aliases.zsh
├── git/
│   ├── .gitconfig           # Main config (includes .gitconfig.local)
│   ├── .gitignore_global
│   └── .gitmessage
├── nvim/                    # Moved from ~/.config/nvim/
│   ├── init.lua
│   └── (all nvim config files)
├── gh/                      # Moved from ~/.config/gh/
│   └── (GitHub CLI config)
├── brewfile/
│   └── Brewfile
├── macos/
│   └── .macos
├── scripts/
│   ├── install.sh           # System setup only
│   ├── link.sh              # Create symlinks
│   └── unlink.sh            # Remove symlinks
├── docs/
│   └── plans/               # Design docs
├── .gitignore
└── README.md
```

## Symlinks

`link.sh` will create these symlinks:

- `~/.zshrc` → `~/.dotfiles/zsh/.zshrc`
- `~/.config/nvim/` → `~/.dotfiles/nvim/`
- `~/.config/gh/` → `~/.dotfiles/gh/`
- `~/.gitconfig` → `~/.dotfiles/git/.gitconfig`
- `~/.gitignore_global` → `~/.dotfiles/git/.gitignore_global`
- `~/.gitmessage` → `~/.dotfiles/git/.gitmessage`

## Migration Strategy

### Phase 1: Backup & Prepare
1. Create backup of current state
2. Remove old `~/.dotfiles/nvim/` (outdated)
3. Create new directory structure

### Phase 2: Move Files
1. Move `~/.dotfiles/.zshrc` → `~/.dotfiles/zsh/.zshrc`
2. Move `~/.dotfiles/aliases.zsh` → `~/.dotfiles/zsh/aliases.zsh`
3. Move git files → `~/.dotfiles/git/`
4. Move `Brewfile` → `~/.dotfiles/brewfile/Brewfile`
5. Move `.macos` → `~/.dotfiles/macos/.macos`
6. Move `~/.config/nvim/` → `~/.dotfiles/nvim/`
7. Move `~/.config/gh/` → `~/.dotfiles/gh/`

### Phase 3: Handle Git Config
1. Update `.gitconfig` to include:
   ```ini
   [include]
       path = ~/.config/.gitconfig.local
   ```
2. Keep `.gitconfig.local` out of repo
3. Document `.gitconfig.local` structure in README

### Phase 4: Create Symlinks
1. Remove existing `~/.zshrc`
2. Run `link.sh` to create all symlinks
3. Test everything works

## Script Design

### `link.sh` - Create Symlinks

- Check if target exists
- If symlink already exists, skip
- If file exists but isn't symlink, warn and skip
- Create symlink with confirmation message
- Use color-coded output (info/success/error)

### `unlink.sh` - Remove Symlinks

- Only remove if target is a symlink
- Won't delete real files
- Confirmation messages for each unlink

### `install.sh` - System Setup

- Keep existing Homebrew installation logic
- Keep Valet/Composer setup
- Remove symlink creation (moved to `link.sh`)

## Git Configuration

### Main `.gitconfig` (in repo)

```ini
[user]
    # User info comes from .gitconfig.local

[core]
    editor = nvim
    excludesfile = ~/.gitignore_global

[commit]
    template = ~/.gitmessage

[include]
    path = ~/.config/.gitconfig.local
```

### `.gitconfig.local` (NOT in repo)

```ini
[user]
    name = Your Name
    email = your.email@example.com

[github]
    user = yourusername
    token = ghp_token_here
```

User will review and remove duplicates from main config.

## Repository `.gitignore`

```
.DS_Store
*.local
.config/.gitconfig.local
```

## README Documentation

README will include:
- Structure overview
- Installation instructions (clone → install.sh → link.sh)
- Git local config setup instructions
- Usage (link.sh, unlink.sh)
- How to add new dotfiles
- Template for `.gitconfig.local`

## Benefits

1. **Clean organization** - Grouped by app, easy to find configs
2. **Separation of concerns** - System setup vs dotfile linking
3. **Safe operations** - Scripts check before overwriting
4. **Easy testing** - Can link/unlink repeatedly
5. **Standard approach** - Follows common dotfile patterns
6. **Documented** - Clear README for future reference
7. **Secure** - Sensitive config stays out of repo

## Implementation Order

1. Create design document (this file) ✓
2. Create directory structure
3. Move files to new locations
4. Create scripts (link.sh, unlink.sh)
5. Update install.sh
6. Update .gitconfig
7. Write README
8. Test linking/unlinking
9. Commit changes
