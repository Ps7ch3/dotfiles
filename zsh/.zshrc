# === p10k ===
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# === default ===
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export TERM=xterm-256color

export PATH=/opt/homebrew/bin:$PATH

export XDG_CONFIG_HOME="$HOME/.config"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# === zinit ===
IS_ZINIT_INSTALL=0
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d $ZINIT_HOME ]
then
    mkdir -p "$(dirname $ZINIT_HOME)"
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
    echo "Zinit is installed, source your zshrc again."
else
    IS_ZINIT_INSTALL=1
    source "${ZINIT_HOME}/zinit.zsh"
fi

if [ $IS_ZINIT_INSTALL -eq 1 ]
then
    zinit ice lucid wait='0' atload='_zsh_autosuggest_start'
    zi light "zsh-users/zsh-autosuggestions"

    zi ice from"gh-r" as"program"
    zi light "junegunn/fzf"

    zi snippet OMZP::git
    zi snippet OMZP::tmux
    zi snippet OMZP::z
fi

# === plugin config ===
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5f5f5f" # https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg

# source ohmyzsh
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source $HOME/.fzf.zsh

# === User configuration ===
alias nv="nvim"

# git-cz
alias cz="git-cz --disable-emoji --scope"  # due to https://github.com/streamich/git-cz/issues/164

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(''"$HOME"'/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/miniconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# === nvm ===
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# === Others ===
export PATH="$PATH:$HOME/.ft"

alias xcopy='xclip -selection clipboard'
alias xpaste='xclip -selection clipboard -o'
