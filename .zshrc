# -----------------------------
# ZSH CONFIG FOR POWER USERS
# -----------------------------

### ENVIRONMENT VARIABLES
export ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR=/usr/local/share/zsh-syntax-highlighting/highlighters

### 1. OPTIONS & HISTORY
setopt prompt_subst         # allow command substitution in prompt
setopt hist_ignore_all_dups # no duplicate entries
setopt share_history        # shared history between sessions
setopt autocd               # allow folder name as cd
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

### 2. COLOR SUPPORT
autoload -U colors && colors

### 3. PROMPT
parse_git_branch() {
  local branch=$(git symbolic-ref --short HEAD 2>/dev/null)
  [[ -n "$branch" ]] && echo "($branch)"
}
PROMPT='%F{green}%n@%m %F{cyan}%~ %F{yellow}$(parse_git_branch)%f ▶ '

### 4. ALIASES
# Navigation & files
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias c='clear'
alias reload='source ~/.zshrc'
alias path='echo $PATH | tr ":" "\n"'

# LS - use eza if available
if command -v eza &>/dev/null; then
  alias ls='eza --icons'
  alias ll='eza -lah --git'
else
  alias ls='ls -G' # macOS: enable color
  alias la='ls -la'
  alias ll='ls -lh'
  alias l='ls -CF'
fi

# History search
alias hrep='history | grep'

# Git
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gca='git commit -a'
alias gp='git push'
alias gl='git pull'
alias gb='git branch'
alias gco='git checkout'
alias gd='git diff'
alias gcl='git clone'

# ImageMagick v7 aliases
alias convertpdf='magick -density 300'
alias imgresize='magick mogrify -resize'
alias img2jpg='magick mogrify -format jpg'
alias imgcompress='magick mogrify -quality 85'
alias imginfo='magick identify -verbose'

# Safer delete
alias rm='rm -i'

# Networking
alias myip='curl ifconfig.me'
alias ports='lsof -i -P -n | grep LISTEN'

# System info
alias topcpu='ps -Ao user,uid,comm,pid,pcpu,pmem --sort=-pcpu | head -n 10'
alias topmem='ps -Ao user,uid,comm,pid,pmem,pcpu --sort=-pmem | head -n 10'
alias e='exit'

# Developer utilities
alias killport='f() { lsof -ti tcp:$1 | xargs -r kill -9 }; f'  # Kill process listening on port

### 5. FUNCTIONS
# Sanitize filenames: lowercase + replace spaces with _
sanitize_filename() {
  echo "$1" | tr '[:upper:]' '[:lower:]' | tr ' ' '_'
}

# Resize all images recursively to 1920px wide if wider, and if not already processed
resize_all_1920() {
  find . -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.gif' -o -iname '*.tiff' \) | while read -r file; do
    width=$(magick identify -format "%w" "$file" 2>/dev/null)
    if [[ "$width" -gt 1920 ]]; then
      dir=$(dirname "$file")
      base=$(basename "$file")
      ext="${base##*.}"
      name="${base%.*}"
      ext_lower=$(echo "$ext" | tr '[:upper:]' '[:lower:]')
      newname="$(sanitize_filename "$name")-1920_resized.$ext_lower"
      if [[ ! -f "$dir/$newname" ]]; then
        magick "$file" -resize 1920x "$dir/$newname"
        echo "Resized $file → $dir/$newname"
      else
        echo "Skipped $file (already resized)"
      fi
    else
      echo "Skipped $file (width $width ≤ 1920)"
    fi
  done
}

# Resize all images recursively to 1200px wide if wider, and if not already processed
resize_all_1200() {
  find . -type f \( -iname '*.jpg' -o -iname '*.jpeg' -o -iname '*.png' -o -iname '*.gif' -o -iname '*.tiff' \) | while read -r file; do
    width=$(magick identify -format "%w" "$file" 2>/dev/null)
    if [[ "$width" -gt 1200 ]]; then
      dir=$(dirname "$file")
      base=$(basename "$file")
      ext="${base##*.}"
      name="${base%.*}"
      ext_lower=$(echo "$ext" | tr '[:upper:]' '[:lower:]')
      newname="$(sanitize_filename "$name")-1200_resized.$ext_lower"
      if [[ ! -f "$dir/$newname" ]]; then
        magick "$file" -resize 1200x "$dir/$newname"
        echo "Resized $file → $dir/$newname"
      else
        echo "Skipped $file (already resized)"
      fi
    else
      echo "Skipped $file (width $width ≤ 1200)"
    fi
  done
}

# Aliases for image resize
alias resize1920='resize_all_1920'
alias resize1200='resize_all_1200'

### 6. FZF (if installed)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

### 7. AUTOJUMP/ZOXIDE (for fast folder nav)
# Install with: brew install zoxide
if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi

### 8. ENHANCED TOOLS
# Use modern replacements if available
if command -v bat &>/dev/null; then alias cat='bat'; fi

### 9. LANGUAGE VERSION MANAGERS
# NVM (Node Version Manager)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Pyenv (Python Version Manager)
if command -v pyenv &>/dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

### 10. SYNTAX HIGHLIGHTING & AUTOSUGGESTIONS
# Make sure these are last
if [[ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [[ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

### 11. DYNAMIC TERMINAL TITLE
precmd() {
  echo -ne "\033]0;${USER}@${HOST}:${PWD/#$HOME/~}\007"
}

