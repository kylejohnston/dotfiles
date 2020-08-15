# Dotfiles

Based on Dries Vints' dotfiles; read the blog post: https://driesvints.com/blog/getting-started-with-dotfiles

Customized for my environment…

## A Fresh macOS Setup

Follow these install instructions to setup a new Mac.

1. Update macOS to the latest version with the App Store
2. (Optional) Install Xcode from the App Store, open it and accept the license agreement
3. Install macOS Command Line Tools by running `xcode-select --install`
4. Copy public and private SSH keys to `~/.ssh` and make sure they're set to `600`
5. Clone this repo to `~/.dotfiles`
6. Append `/usr/local/bin/zsh` to the end of your `/etc/shells` file [$ open /etc/shells]
7. Run `install.sh` to start the installation [$ sh install.sh]
8. Make sure Dropbox is set up and synced
9. Update apps that use Dropbox to store settings
10. Restart your computer to finalize the process

Install (oh-my-zsh)[https://github.com/robbyrussell/oh-my-zsh]
Symlink .dotfiles/.zshrc to ~/.zshrc
