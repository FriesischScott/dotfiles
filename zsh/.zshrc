# ~/.zshrc

umask 022

# install zplug if not yet installed
if [[ ! -d ${ZDOTDIR:-~}/.antidote ]]; then
    git clone --depth=1 https://github.com/mattmc3/antidote.git ${ZDOTDIR:-~}/.antidote
fi

source ${ZDOTDIR:-~}/.antidote/antidote.zsh

autoload -Uz compinit
compinit

antidote load

SPACESHIP_PROMPT_ORDER=(
    user          # Username section
    dir           # Current directory section
    host          # Hostname section
    git           # Git section (git_branch + git_status)
    node          # Node.js section
    golang        # Go section
    julia         # Julia section
    docker        # Docker section
    venv          # virtualenv section
    exec_time     # Execution time
    line_sep      # Line break
    battery       # Battery level and status
    jobs          # Background jobs indicator
    exit_code     # Exit code section
    char          # Prompt character
)

## history file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history # share command history data

autoload -Uz promptinit && promptinit && prompt spaceship

# List directory contents
alias ls='ls --color=auto'
alias lsa='ls -lah'
alias l='ls -lah'
alias ll='ls -lh'
alias la='ls -lAh'

# fix delete key
bindkey	"^[[3~"		delete-char
bindkey	"^[3;5~"	delete-char

# reload configurations
alias reload="exec ${SHELL} -l"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/behrensd/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<
