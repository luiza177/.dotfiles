export PATH="/opt/homebrew/opt/ruby/bin:$HOME/.local/bin:$HOME/bin:$PATH"

eval "$(starship init zsh)"
# TODO: add non-starship prompt in comment

# ----------- ALIASES
# alias ll="ls -lhs --color=auto"
alias ll="eza -F always -l --icons=auto --color-scale=age --hyperlink --no-user"
alias lt="eza -F always -l -T --level=2 --icons=auto --color-scale=age --hyperlink --no-user"
# alias la="ls -lahs --color=auto"
alias la="eza -F always -l -a --icons=auto --color-scale=age --hyperlink --no-user"
alias lat="eza -F always -l -T --level=2 -a --icons=auto --color-scale=age --hyperlink --no-user"
alias l.="ls -d .* --color=auto"
alias grep="grep --color=auto"
alias g="git"
alias gs="git status"
alias gc="git checkout"
alias ga="git add ."
alias gC="git commit -m"
alias gP="git push"
alias gp="git pull"
alias lg="lazygit"
alias gd="git diff"

export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

export EDITOR="nvim"
export VISUAL="nvim"

# HINT: type command (eg. "nvim") then use arrows to go up/down in history
# HISTORY SETUP
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

  # --------------
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# TODO: run tmux at startup

# FZF stuff
eval "$(fzf --zsh)"

# export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
# export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# export FZF_ALT_C_COMMAND="fs --type d --hidden --strip-cwd-prefix --exclude .git" # WARN: conflicts with aerospace
export FZF_ALT_C_COMMAND="fs --type d --hidden --exclude .git"
# TODO: fzf git?

# Q: fd compgen path and dir ??

# --------------
eval "$(zoxide init zsh)"
alias cd="z"
