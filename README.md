# Dotfiles

My personal dotfiles for macOS, managed with symlinks.

## Structure

```
~/.dotfiles/
├── zsh/              # Zsh configuration and aliases
├── git/              # Git configuration (main config + ignore patterns)
├── nvim/             # Neovim configuration
├── gh/               # GitHub CLI configuration
├── macos/            # macOS system preferences
├── scripts/          # Installation and linking scripts
├── Brewfile          # Homebrew package list
└── docs/             # Documentation and design docs
```

## Installation

### First Time Setup

1. **Clone this repository:**
   ```bash
   git clone <your-repo-url> ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Run system setup** (installs Homebrew, packages, Valet, etc.):
   ```bash
   ./scripts/install.sh
   ```

3. **Create symlinks:**
   ```bash
   ./scripts/link.sh
   ```

4. **Set up local git config** (see below)

5. **Restart your terminal** to load the new shell configuration

### Git Configuration

The main `.gitconfig` is in the repository and contains shared settings. For machine-specific and sensitive information, create `~/.config/.gitconfig.local`:

```bash
# Create the local config file
touch ~/.config/.gitconfig.local
chmod 600 ~/.config/.gitconfig.local  # Keep it private
```

Add your personal information to `~/.config/.gitconfig.local`:

```ini
[user]
    name = Your Name
    email = your.email@example.com

[github]
    user = yourusername
    token = ghp_your_token_here

# Add any other machine-specific or private settings here
```

**Important:** Review your existing `.gitconfig.local` and remove any settings that duplicate those in the main `.gitconfig` to avoid conflicts.

## Usage

### Link dotfiles

Creates symlinks from your home directory to the dotfiles in this repo:

```bash
cd ~/.dotfiles
./scripts/link.sh
```

This will create:
- `~/.zshrc` → `~/.dotfiles/zsh/.zshrc`
- `~/.config/nvim/` → `~/.dotfiles/nvim/`
- `~/.config/gh/` → `~/.dotfiles/gh/`
- `~/.gitconfig` → `~/.dotfiles/git/gitconfig`
- `~/.gitignore_global` → `~/.dotfiles/git/gitignore_global`
- `~/.gitmessage` → `~/.dotfiles/git/gitmessage`

### Unlink dotfiles

Safely removes symlinks (won't delete real files):

```bash
cd ~/.dotfiles
./scripts/unlink.sh
```

### Update system packages

Re-runs the system setup (Homebrew, Valet, etc.):

```bash
cd ~/.dotfiles
./scripts/install.sh
```

## Adding New Dotfiles

1. **Move or create** the config file in the appropriate directory:
   ```bash
   # Example: adding tmux config
   mkdir -p ~/.dotfiles/tmux
   mv ~/.tmux.conf ~/.dotfiles/tmux/.tmux.conf
   ```

2. **Add symlink commands** to both scripts:
   - In `scripts/link.sh`: `link "$DOTFILES/tmux/.tmux.conf" "$HOME/.tmux.conf"`
   - In `scripts/unlink.sh`: `unlink_if_symlink "$HOME/.tmux.conf"`

3. **Test the linking:**
   ```bash
   ./scripts/link.sh
   ```

4. **Commit and push:**
   ```bash
   git add .
   git commit -m "Add tmux configuration"
   git push
   ```

## Syncing to Another Machine

1. Clone this repo on the new machine
2. Run `./scripts/install.sh` (first time only)
3. Run `./scripts/link.sh`
4. Create `~/.config/.gitconfig.local` with machine-specific settings
5. Restart terminal

## Notes

- **Brewfile**: Contains all Homebrew packages, casks, and Mac App Store apps
- **macos/.macos**: Script that sets macOS system preferences
- **Sensitive data**: Never commit tokens, passwords, or personal info. Keep them in `.gitconfig.local`
- **Shell changes**: After updating zsh configs, run `source ~/.zshrc` or restart your terminal

## Troubleshooting

**Symlink already exists:**
- If `link.sh` reports a file already exists, back it up manually and remove it, then re-run `link.sh`

**Git config not working:**
- Ensure `~/.config/.gitconfig.local` exists and has correct permissions (600)
- Check that there are no duplicate settings between main config and local config

**Zsh not loading:**
- Verify `~/.zshrc` is a symlink: `ls -la ~/.zshrc`
- Check for syntax errors: `zsh -n ~/.dotfiles/zsh/.zshrc`

## License

MIT License - feel free to use and modify as needed.
