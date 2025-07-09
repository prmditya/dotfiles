# My Dotfiles

Welcome to my dotfiles repository!  
Here I store and manage my personal configurations for my Linux environment (specifically Arch Linux) using [GNU Stow](https://www.gnu.org/software/stow/) and Git.

The primary goal of this repository is to quickly bootstrap my development environment on new machines and maintain consistency across devices.

---

## ✨ Screenshots

### Hyprland:
<div align="center">
  <img src="https://github.com/user-attachments/assets/fd3bdd16-1f9b-4df9-bca2-e65f569fca8e" alt="Hyprland screenshot">
</div>

### dwm (with patches: vanitygaps, attachbelow, alwayscenter, systray, xrdb):
<div align="center">
  <img src="https://github.com/user-attachments/assets/b2e34bbe-ccfb-45fe-b54f-67b8900e832f" alt="dwm screenshot">
</div>

---

## 📁 Directory Structure

```bash
.
├── archive/          # Archived/legacy configs (i3, polybar, etc.)
├── dunst/            # Notification daemon config
├── suckless/         # suckless software that im using
│   └── dwm/          # dwm source and patches
│   │   └── patches/  # Custom patches used
│   └── st/           # st source and patches
│       └── patches/  # Custom patches used
├── fastfetch/
├── ghostty/
├── hypr/             # Hyprland setup
├── nvim/             # Neovim config
├── picom/            # Compositor settings
├── redshift/         # Color temperature config
├── rofi/             # Rofi launcher config
├── scripts/          # Utility shell scripts
│   └── scripts/
│       ├── screenshot.sh
│       ├── dwmbar.sh
│       ├── pick-wallpaper.sh
│       └── ...
├── vscode/           # Visual Studio Code settings
├── waybar/
├── wofi/
├── zed/
├── zellij/
├── zsh/
└── README.md
```

---

## ⚙️ Installation & Usage

This repository is designed to be used with [GNU Stow](https://www.gnu.org/software/stow/) to manage dotfiles via symlinks.

### 🔧 Prerequisites

Make sure the following are installed:
```bash
sudo pacman -S git stow
```

### 🚀 Setup Instructions

1. **Clone this repo to `$HOME`:**
   ```bash
   git clone https://github.com/prmditya/dotfiles.git ~/dotfiles
   cd ~/dotfiles
   ```

2. **Remove existing config files that will be replaced by symlinks:**
   Make sure to back them up or move them into your dotfiles folder structure.

   ```bash
   rm ~/.zshrc
   rm ~/.wezterm.lua
   rm ~/.config/Code/User/settings.json
   rm ~/.config/Code/User/keybindings.json
   ```

3. **Use `stow` to symlink configurations:**
   ```bash
   stow zsh
   stow nvim
   stow dunst
   stow rofi
   stow scripts
   stow vscode
   stow hypr
   stow ghostty
   ```

4. **Reload your shell:**
   ```bash
   source ~/.zshrc
   ```

5. **(Optional) Build `dwm`:**
   ```bash
   stow dwm
   cd ~/dwm
   sudo make clean install
   ```

---

## 🧩 dwm Custom Patches

These patches have been applied to the `dwm` build:

- [`vanitygaps`](https://dwm.suckless.org/patches/vanitygaps/)
- [`attachbelow`](https://dwm.suckless.org/patches/attachbelow/)
- [`alwayscenter`](https://dwm.suckless.org/patches/alwayscenter/)
- [`systray`](https://dwm.suckless.org/patches/systray/)
- [`xrdb`](https://dwm.suckless.org/patches/xrdb/)

All patches are stored in:  
`~/dwm/patches/ # after stow dwm or in ~/dotfiles/dwm/dwm/patches/`

---

## 🪪 License

These dotfiles are for personal use and learning.  
Some configurations include code from upstream open-source projects like [Suckless](https://suckless.org/).

---

Thanks for visiting!  
Feel free to fork or star ⭐ this repo if you find it useful.
