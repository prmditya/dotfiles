# My Dotfiles

<div align=center>
  
![screenshot](https://github.com/user-attachments/assets/77d65307-c884-4e81-8585-24c3371a923b)

</div>

Welcome to my dotfiles repository! Here, I store and manage my personal configurations for my Linux environment (specifically Arch Linux) using [GNU Stow](https://www.gnu.org/software/stow/) and Git.

The primary goal of this repository is to facilitate quick setup of my development environment on new machines and maintain consistency across all my devices.

## Installation and Usage

This repository is designed to be deployed using [GNU Stow](https://www.gnu.org/software/stow/).

### Prerequisites

Before setting up the dotfiles, ensure you have the following installed:

- **Git**: To clone this repository.
- **GNU Stow**: To manage the symlinks.
  ```bash
  # On Arch Linux
  sudo pacman -S stow
  ```

### Setup Steps

1.  **Clone this repository:**
    Clone your dotfiles repository into your `$HOME` directory (e.g., `~/dotfiles`).

    ```bash
    git clone https://github.com/prmditya/dotfiles.git ~/dotfiles
    ```

2.  **Navigate into the dotfiles directory:**

    ```bash
    cd ~/dotfiles
    ```

3.  **Remove existing configuration files (if any) from your `$HOME` that will be replaced by symlinks:**
    This is a crucial step. If an original file already exists at the target location, `stow` will error out.

    - **IMPORTANT**: Ensure you have already moved these original files into the appropriate structure within your `~/dotfiles/` repository **before deleting them from `$HOME`**.

    ```bash
    # Example for Zsh:
    rm ~/.zshrc

    # Example for WezTerm:
    rm ~/.wezterm.lua

    # Example for VS Code:
    # Be careful with rm -rf! Ensure the contents of the User folder are backed up
    # in ~/dotfiles/vscode/.config/Code/User/ before removing.
    rm ~/.config/Code/User/settings.json
    rm ~/.config/Code/User/keybindings.json
    # If you manage the entire User folder via stow:
    # rm -rf ~/.config/Code/User
    ```

4.  **Run `stow` for each module:**
    This will create symbolic links from your `~/dotfiles/<module>/` directories to their respective locations in your `$HOME`. Run this at `~/dotfiles` or `cd ~/dotfiles` first.

    ```bash
    stow zsh
    stow wezterm
    stow vscode
    # Add other modules here if you have them (e.g., stow nvim, stow rofi, etc.)
    ```

5.  **Reload your shell** or open a new terminal to apply the Zsh changes:

    ```bash
    source ~/.zshrc
    ```

6.  **Done!** Your configurations should now be active.
