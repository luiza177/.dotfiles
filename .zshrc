export PATH="/opt/homebrew/opt/ruby/bin:$HOME/bin:$PATH"

eval "$(starship init zsh)"

# ----------- ALIASES
# alias ll="ls -lhs --color=auto"
alias ll="eza -F always -l --icons=auto --color-scale=age --hyperlink --no-user"
alias lt="eza -F always -l -T --level=2 --icons=auto --color-scale=age --hyperlink --no-user"
# alias la="ls -lahs --color=auto"
alias la="eza -F always -l -a --icons=auto --color-scale=age --hyperlink --no-user"
alias lat="eza -F always -l -T --level=2 -a --icons=auto --color-scale=age --hyperlink --no-user"
alias l.="ls -d .* --color=auto"
alias grep="grep --color=auto"

export LDFLAGS="-L/opt/homebrew/opt/ruby/lib"
export CPPFLAGS="-I/opt/homebrew/opt/ruby/include"

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
