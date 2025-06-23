# Make sure Fastfetch runs first if it's installed.
# This should be at the very top of your .zshrc to ensure it prints before the prompt.
if command -v fastfetch &> /dev/null; then
  fastfetch
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git history-substring-search)
source $ZSH/oh-my-zsh.sh

# Additional plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ********************************************
# * Aliases
# ********************************************
alias ls='lsd'
alias ll='lsd -l'
alias lla='lsd -al'
alias lzgit='lazygit'
alias vim='nvim'

# fzf based aliases

# Search history with fzf (bound to Ctrl+R by default, but good to have as an alias too)
alias fzh='history | fzf'

# Find files and directories with fzf, then open with zoxide (if installed) or cd/nvim
# This will default to `nvim` for files and `z` (zoxide) for directories.
fz() {
  local file
  file=$(fzf --preview 'bat --color=always --line-range :500 {}' \
             --preview-window=right:50% \
             --height=80% \
             --border \
             --prompt="Find anything: " \
             --bind "ctrl-o:execute(nvim {} &> /dev/null & disown)" \
             --bind "ctrl-d:execute(z {}) &> /dev/null & disown" \
             --bind "ctrl-c:abort" \
             --print-query \
             --print0 \
             < <(find . -mindepth 1 -maxdepth 5 -path '*/\.*' -prune -o -print -o -exec grep -l {} \; | sed 's/^\.\///'))

  if [[ -n "$file" ]]; then
    if [[ -d "$file" ]]; then
      z "$file"
    elif [[ -f "$file" ]]; then
      nvim "$file"
    fi
  fi
}

# fzf for yay (Arch Linux/AUR helper)
# This lets you search for packages and install/view them.
yayf() {
  yay -Slq | fzf -m --preview 'yay -Si {1}' --prompt="Search AUR/Repo: " | xargs -ro yay -S
}

# fzf to find recent files (modified in the last 7 days, excluding dotfiles/dirs)
fr() {
  find . -maxdepth 4 -type f -mtime -7 \
    -not -path '*/\.*' \
    -print0 | fzf --read0 --ansi --multi --no-sort --tac \
    --header 'Find recent files (last 7 days)' \
    --prompt="Select files: " \
    --preview 'bat --color=always --line-range :500 {}' \
    --bind "ctrl-o:execute(nvim {} &> /dev/null & disown)" \
    --bind "enter:execute(nvim {} &> /dev/null & disown)" \
    --bind "ctrl-c:abort"
}

# fzf to find files with specific content (using grep)
fgp() {
  if [ -z "$1" ]; then
    echo "Usage: fgrep <pattern>"
    return 1
  fi
  grep -rli --color=always "$1" . | fzf --ansi --prompt="Files matching '$1': " --preview 'bat --color=always --line-range :500 {}'
}

# fzf to switch between git branches
fgb() {
  local branch
  branch=$(git branch -a --color=always | grep -v '/HEAD\s' | fzf --ansi --header="Checkout branch:" --preview 'git log --oneline --graph --date=short --pretty=format:"%C(yellow)%h%Creset %C(green)%ad%Creset %C(blue)%an%Creset %s" --color=always {1}' --preview-window right:60%)
  if [[ -n "$branch" ]]; then
    git checkout $(echo "$branch" | awk '{print $1}' | sed "s/.*-> //")
  fi
}

# ********************************************
# * End of Aliases
# ********************************************

# Tools setup
eval "$(zoxide init zsh)"

# fzf configuration (Ensure these are loaded after Oh My Zsh)
if [ -f /usr/share/fzf/key-bindings.zsh ]; then
  source /usr/share/fzf/key-bindings.zsh
fi

if [ -f /usr/share/fzf/completion.zsh ]; then
  source /usr/share/fzf/completion.zsh
fi

# Path configuration
export PATH=$PATH:/home/ditya/.spicetify
export PATH="/usr/lib/zed:$PATH"

# Powerlevel10k theme initialization
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
