# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"


# Trying to get tmux copy (tmux-yank) to work
# export DISPLAY=:0
# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="powerlevel10k/powerlevel10k"
ZSH_THEME="jispwoso"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" "gnzh" "jispwoso")

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    # common-aliases  # I want to try these out sometime
    git
    # git-extras    # check out sometime might be cool
    # taskwarrior   # I should also look into Taskwarrior lol
    # WARNING: DO NOT USE THE TMUX ZSH PLUGIN. It prevents being able to copy from Nvim through Tmux. Caused me so much pain...
    # tmux      # Wait until I start using tmux. Might conflict with tmux customizations or with NVChad, if I use it.
    # vi-mode       # I'm using the custom zsh-vi-mode so I might ignore this
    web-search      # allows for web search by "ddg how to bake a cake" etc.
    # z             # For zoxide, but is giving some problems and doesn't seem necessary
    zoxide
    zsh-vi-mode # custom; this might be messing up tmux
    zsh-autosuggestions
)
# Trying to get the autosuggest to use a better keybind than <right>
# Tab is normal autocomplete, though, so is no good
bindkey '<tab>' autosuggest-accept

# Start Tmux automatically
# ZSH_TMUX_AUTOSTART="true"
# ZSH_TMUX_AUTOSTART_ONCE="true"

source $ZSH/oh-my-zsh.sh
# Should I keep the below line?
#tmux source ~/.config/tmux/tmux.conf
if [ "$TMUX" ]; then
  echo "Already in a tmux session"
else
  echo "No tmux detected; starting tmux"
  tmux
fi

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# Enable Vi mode in zsh
bindkey -v

# I don't really use these any more in favor of `ssh hpg` with a custom config
# Alias ssh-ing into HiPerGator
alias sshp="ssh sasank.desaraju@hpg.rc.ufl.edu"
# Alias sftp-ing into HiPerGator
alias sfhp="sftp sasank.desaraju@hpg.rc.ufl.edu"

# Apt aliases
alias sad="sudo apt update"
alias sag="sudo apt upgrade"
alias sai="sudo apt install"
# Using nala instead of apt
alias snd="sudo nala update"
alias sng="sudo nala upgrade"
alias sngy="sudo nala upgrade -y"
alias sni="sudo nala install"

# Alias ls to use eza instead of normal ls
alias ls="eza"
alias ll="eza -la"
alias lt="eza -lasnew"
alias la="eza -la"
alias zz="z .."

alias open="xdg-open"

eval "$(zoxide init zsh)"



# alias the shapeworks studio command to shapworks
alias shapeworks="/home/sasank/ShapeWorks-v6.3.0-linux/bin/ShapeWorksStudio"

# Add TeX Live to PATH
export PATH="/usr/local/texlive/2022/bin/x86_64-linux:$PATH"
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"

# *** EMACS
# Add Doom to the PATH
export PATH="$HOME/.config/emacs/bin:$PATH"
# Alias Emacs
alias emacs="emacsclient -c -a 'emacs'"

# *** VIM/NEOVIM
# alias nvim to nv
alias nv="~/Applications/nvim.appimage"
alias nvim="~/Applications/nvim.appimage"

# Alias LazyVim
alias lvim="NVIM_APPNAME=LazyNvim nvim"

# Alias AstroVim
alias avim="NVIM_APPNAME=AstroNvim nvim"

# Alias Jannik Buhr's Quarto Kickstart NeoVim; it's not just Quarto but I'll just refer to it as such
alias qvim="NVIM_APPNAME=QuartoNvim nvim"

# Alias NVChad's starter repo (which is apparently what users are actually supposed to use)
alias cvim="NVIM_APPNAME=NVChad nvim"

# Source .zshrc and .bashrc easily
alias zsrc="source ~/.zshrc"
#alias bsource="source ~/.bashrc"

# Conda activate
alias ca="conda activate"

# Stop Ollama server (since it doesn't actually stop when I stop it)
alias stop_ollama="systemctl stop ollama.service"

# Add Slicer to PATH
#export PATH="$HOME/Applications/Slicer-5.6.1-linux-amd64/Slicer:$PATH"
export PATH="$HOME/Applications/Slicer-5.6.1-linux-amd64:$PATH"

# Run tmux
# if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
#   exec tmux
# fi

# Neofetch
# alias neofetch="neofetch --ascii_colors 129 254 --colors 129 254 30 60 90 150 --ascii_distro Ubuntu_small"
# neofetch
# --ascii_distro Ubuntu_small       # to make the distro the small version. Might implement later...
# Fastfetch
# alias fastfetch="fastfetch --ascii_colors 129 254 --colors 129 254 30 60 90 150 --ascii_distro Ubuntu_small"
# fastfetch

# Add Mojo/Modular to PATH
export MODULAR_HOME="/home/sasank/.modular"
export PATH="/home/sasank/.modular/pkg/packages.modular.com_mojo/bin:$PATH"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/sasank/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/sasank/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/sasank/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/sasank/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# p10k source
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fzf line
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/sasank/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH=$PATH:/home/sasank/.spicetify

export PATH="/home/sasank/.pixi/bin:$PATH"
eval "$(pixi completion --shell zsh)"

[ -f ~/.zshenv ] && source ~/.zshenv

# Shell-GPT integration ZSH v0.2
_sgpt_zsh() {
if [[ -n "$BUFFER" ]]; then
    _sgpt_prev_cmd=$BUFFER
    BUFFER+="⌛"
    zle -I && zle redisplay
    BUFFER=$(sgpt --shell <<< "$_sgpt_prev_cmd" --no-interaction)
    zle end-of-line
fi
}
zle -N _sgpt_zsh
bindkey ^o _sgpt_zsh    # This is the keybind for the completion
# Shell-GPT integration ZSH v0.2
