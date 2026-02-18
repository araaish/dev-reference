# araaish's zsh config

# ─────────────────────────────────────────
# ENVIRONMENT
# ─────────────────────────────────────────

export EDITOR='nvim'
export VISUAL='nvim'

if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
fi

export TMUX_CONF="$HOME/.config/tmux/tmux.conf"

# ─────────────────────────────────────────
# ZINIT - PLUGIN MANAGER
# ─────────────────────────────────────────

if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# ─────────────────────────────────────────
# PLUGINS
# ─────────────────────────────────────────

zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting

# ─────────────────────────────────────────
# PROMPT
# ─────────────────────────────────────────

zinit ice pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

# ─────────────────────────────────────────
# COMPLETIONS
# ─────────────────────────────────────────

autoload -Uz compinit
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

# Case insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Highlighted menu selection
zstyle ':completion:*' menu select

# Group results by category
zstyle ':completion:*' group-name ''

# Verbose descriptions
zstyle ':completion:*' verbose yes

# ─────────────────────────────────────────
# HISTORY
# ─────────────────────────────────────────

HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=50000

setopt HIST_IGNORE_DUPS       # Don't record duplicate consecutive commands
setopt HIST_IGNORE_ALL_DUPS   # Remove older duplicate entries from history
setopt HIST_IGNORE_SPACE      # Don't record commands starting with a space
setopt HIST_SAVE_NO_DUPS      # Don't write duplicate entries to history file
setopt HIST_REDUCE_BLANKS     # Remove superfluous blanks from commands
setopt SHARE_HISTORY          # Share history between all terminal windows
setopt HIST_VERIFY            # Show expanded history command before running it

# ─────────────────────────────────────────
# TOOLS
# ─────────────────────────────────────────

eval "$(zoxide init --cmd cd zsh)"

eval "$(fzf --zsh)"

# ─────────────────────────────────────────
# ALIASES
# ─────────────────────────────────────────

alias c='clear'
alias vim='nvim'
alias ls='eza'

alias gs='git status'
alias ga='git add'
alias gc='git commit -m'
alias gpl='git pull'
alias gpo='git push origin'
alias gl='git log'

# ─────────────────────────────────────────
# RUNTIME MANAGERS
# ─────────────────────────────────────────

export NVM_DIR="$HOME/.nvm"

nvm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
  nvm "$@"
}
node() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
  node "$@"
}
npm() {
  unset -f nvm node npm npx
  [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
  npm "$@"
}

export SDKMAN_DIR="$HOME/.sdkman"

sdk() {
  unset -f sdk java
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
  sdk "$@"
}
java() {
  unset -f sdk java
  [[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"
  java "$@"
}

# ─────────────────────────────────────────
# OPTIONS
# ─────────────────────────────────────────

setopt AUTO_CD
setopt CORRECT
setopt COMBINING_CHARS
setopt INTERACTIVE_COMMENTS

