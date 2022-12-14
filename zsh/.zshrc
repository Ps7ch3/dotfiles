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
export PATH=/opt/homebrew/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME="powerlevel10k/powerlevel10k"


# === zplug ===
IS_ZPLUG_INSTALL=0

if [ ! -d $HOME/.zplug ]
then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    echo "You have installed zplug, source your .zshrc again"
else
    IS_ZPLUG_INSTALL=1
fi

if [ $IS_ZPLUG_INSTALL -eq 1 ]
then
    source ~/.zplug/init.zsh

    zplug "zsh-users/zsh-autosuggestions"
    zplug "junegunn/fzf", as:command

    # ohmyzsh
    zplug "plugins/git", from:oh-my-zsh
    zplug "plugins/tmux", from:oh-my-zsh
    zplug "plugins/z", from:oh-my-zsh

    # Install plugins if there are plugins that have not been installed
    if ! zplug check --verbose; then
        printf "Install? [y/N]: "
        if read -q; then
            echo; zplug install
        fi
    fi

    # Then, source plugins and add commands to $PATH
    zplug load --verbose
fi

# === plugin config ===
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#5f5f5f"

# source ohmyzsh
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source $HOME/.fzf.zsh

# === User configuration ===
alias nv="nvim"

# git-cz
alias cz="git-cz --disable-emoji"  # due to https://github.com/streamich/git-cz/issues/164

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(''"$HOME"'/opt/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/opt/anaconda3/bin:$PATH"
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

