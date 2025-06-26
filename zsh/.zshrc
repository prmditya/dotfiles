# ----------------------------------------
# Pywal (auto colorize my terminal)
# Must run at the very top to print before prompt
if command -v wal &> /dev/null; then
  wal -R -q
fi
# ----------------------------------------
# Fastfetch (show system info at shell startup)
if command -v fastfetch &> /dev/null; then
  fastfetch
fi

# ----------------------------------------
# Oh My Zsh Setup
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(
  git history-substring-search
)
source "$ZSH/oh-my-zsh.sh"

# Additional Plugins (must be sourced after Oh My Zsh)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ----------------------------------------
# Aliases
alias ls='lsd'
alias ll='lsd -l'
alias lla='lsd -al'
alias lzgit='lazygit'
alias vim='nvim'

# ----------------------------------------
# fzf-based Aliases and Functions

# Search shell history with fzf
alias fzh='history | fzf'

# Custom script for listing old files (adjust path if needed)
alias nlof="$HOME/scripts/fzf_listoldfiles.sh"

# fzf helper for yay (Arch Linux AUR helper)
yayf() {
  yay -Slq | fzf -m --preview 'yay -Si {1}' --prompt="Search AUR/Repo: " | xargs -ro yay -S
}

# ----------------------------------------
# Tools Initialization

# zoxide initialization
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"

# fzf key bindings and completion (after Oh My Zsh)
[ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
[ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh

# ----------------------------------------
# PATH additions
export PATH="$PATH:/home/ditya/.spicetify"
export PATH="/usr/lib/zed:$PATH"

# ----------------------------------------
# Node Version Manager (nvm) Setup
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"           # Load nvm
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion" # Load bash_completion for nvm
