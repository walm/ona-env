# reload with `omz reload`
source $HOME/antigen.zsh

antigen use oh-my-zsh
antigen bundle git

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
# antigen bundle hkupty/ssh-agent
antigen bundle common-aliases
antigen bundle atuinsh/atuin@main
antigen bundle z

antigen bundle vi-mode

antigen theme spaceship-prompt/spaceship-prompt
antigen apply

VI_MODE_SET_CURSOR=true

# spaceship-prompt docs https://spaceship-prompt.sh/config/prompt/
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  package       # Package version
  node          # Node.js section
  ruby          # Ruby section
  python        # Python section
  elixir        # Elixir section
  golang        # Go section
  # docker        # Docker section
  host          # Hostname section
  exec_time     # Execution time
  line_sep      # Line break
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)
SPACESHIP_RPROMPT_ORDER=(
  time          # Time stampts section
)

# symbol / icons grab from https://www.nerdfonts.com/cheat-sheet
SPACESHIP_CHAR_SYMBOL_ROOT="#"
SPACESHIP_USER_SHOW="false"
SPACESHIP_TIME_SHOW="false"

SPACESHIP_HOST_SHOW="always"
SPACESHIP_HOST_PREFIX="%F{#434c5e}@ "
SPACESHIP_HOST_COLOR="green"

SPACESHIP_DIR_TRUNC_REPO="false"
SPACESHIP_DIR_TRUNC=5
SPACESHIP_DIR_COLOR="white"

SPACESHIP_GIT_PREFIX="%F{blue}("
SPACESHIP_GIT_SYMBOL=""
SPACESHIP_GIT_SUFFIX="%F{blue}) "
SPACESHIP_GIT_BRANCH_PREFIX=""
SPACESHIP_GIT_BRANCH_COLOR="blue"
SPACESHIP_GIT_STATUS_PREFIX=" "
SPACESHIP_GIT_STATUS_SUFFIX=""
SPACESHIP_GIT_STATUS_AHEAD="▴"
SPACESHIP_GIT_STATUS_BEHIND="▾"
SPACESHIP_GIT_STATUS_DELETED="×"

SPACESHIP_GOLANG_PREFIX=""
SPACESHIP_GOLANG_COLOR="#8fbcbb"
SPACESHIP_GOLANG_SYMBOL="go "

SPACESHIP_RUBY_PREFIX=""
SPACESHIP_RUBY_COLOR="red"
SPACESHIP_RUBY_SYMBOL=" "
# SPACESHIP_RUBY_SYMBOL="ruby "

SPACESHIP_ELIXIR_PREFIX=""
SPACESHIP_ELIXIR_COLOR="magenta"
SPACESHIP_ELIXIR_SYMBOL=" "

SPACESHIP_NODE_PREFIX=""
SPACESHIP_NODE_COLOR="blue"
SPACESHIP_NODE_SYMBOL=" "

# prepend to path
path=("$HOME/.local/bin" $path)
path=("$HOME/bin" $path)
export PATH

# completion
if command -v gitpod &>/dev/null; then
  # FIXME: seems not working in gitpod instans
  # gitpod completion zsh > "${fpath[1]}/_gitpod"
fi

eval "$(mise activate zsh)"

export EDITOR=nvim

type exa &>/dev/null && alias ls='exa --git'

alias j=z
alias g=git
alias ona=gitpod
alias lg=lazygit
alias d=docker
alias vim=nvim
alias e=nvim
alias v=view
alias more=view
alias ag=rga
alias cld=claude
alias cldt=claude-trace

if ! command -v btop &>/dev/null; then 
  alias btop="mise x btop@latest -- btop --force-utf"
fi

# copilot for cli
alias \?\?="gh copilot suggest -t shell"
# alias: ghcs ghce
# https://docs.github.com/en/copilot/managing-copilot/configure-personal-settings/configuring-github-copilot-in-the-cli#setting-up-aliases
# eval "$(gh copilot alias -- zsh)"

alias :q=exit

. "$HOME/.atuin/bin/env"
eval "$(atuin init zsh)"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/vscode/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/vscode/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/vscode/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/vscode/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

