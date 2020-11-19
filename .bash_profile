HOST_NAME=cazaustre-mbp15

source ~/.nvm/nvm.sh
nvm use stable
shopt -s autocd
shopt -s histappend

export PATH=$PATH:$HOME/bin
export COWPATH="$COWPATH:$HOME/.cowsay"

export HISTSIZE=5000
export HISTFILESIZE=10000

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

txtred='\e[0;31m' # Red
txtgrn='\e[0;32m' # Green
bldgrn='\e[1;32m' # Bold Green
bldpur='\e[1;35m' # Bold Purple
txtrst='\e[0m'    # Text Reset

emojis=("💻 " "☕️ " "🍺 " "🍕 " "🥑 " "🎒 ")

EMOJI=${emojis[$RANDOM % ${#emojis[@]} ]}

print_before_the_prompt () {
    dir="🗂  ${PWD}"
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    node=" »  ⬢ $(node -v)"
    deno=" »  🦕 $(deno --version)"
    rust=" »  ⚙️  v$(rustc -V | awk '{print $2}')"
    printf "\n $txtred%s » $bldpur%s $txtgrn%s %s $txtrst%s\n" " ${HOST_NAME}" "$dir" "$(vcprompt)" "${node}"
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1="$EMOJI "

fortune | cowsay -f fine

function mkcd() {
	mkdir $1 && cd $1
}

# -------
# Aliases
# -------
alias dev="cd ~/dev"
alias work="cd ~/dev/work"
alias pet="cd ~/dev/sandbox"
alias c='code .'
alias ns='npm start'
alias nr='npm run'
alias nd='npm run dev'
alias yd='yarn dev'
alias l="ls" # List files in current directory
alias ll="ls -al" # List all files in current directory in long list format
alias la="ls -al" # List all files in current directory in long list format
alias o="open ." # Open the current directory in Finder

# ----------------------
# Git Aliases
# ----------------------
alias gaa='git add .'
alias gcm='git commit -m'
alias gi='git init'
alias gl='git log'
alias gp='git pull'
alias gpsh='git push'

export PATH="$HOME/.cargo/bin:$PATH"
