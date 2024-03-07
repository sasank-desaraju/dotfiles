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

# Add Doom to the PATH
export PATH="$HOME/.config/emacs/bin:$PATH"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="random"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )
# ZSH_THEME_RANDOM_CANDIDATES=(
# "philips"
# "xiong-chiamiov"
# "zfowler" # maybe...
# "smt"
# "kolo"
# "wedisagree"
# "mikeh"
# "clean"
# "pygmalion"
# "gnzh"
# "agnoster"
# "amresh"  # this is that custom Indian one
# "zsh2000" # custom powerline-looking theme
# "headline"
# )

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

# Enable Vi mode in zsh
bindkey -v

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
    tmux      # Wait until I start using tmux. Might conflict with tmux customizations or with NVChad, if I use it.
    # vi-mode       # I'm suing the custom zsh-vi-mode so I might ignore this
    web-search      # allows for web search by "ddg how to bake a cake" etc.
    # z             # For zoxide, but is giving some problems and doesn't seem necessary
    zoxide
    zsh-vi-mode # custom; this might be messing up tmux
)

# Start Tmux automatically
ZSH_TMUX_AUTOSTART="false"
ZSH_TMUX_AUTOSTART_ONCE="true"

source $ZSH/oh-my-zsh.sh
# Should I keep the below line?
tmux source ~/.config/tmux/tmux.conf

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"
#
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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias op='xdg-open'

# alias nvim to nv
alias nv="~/Applications/nvim.appimage"
alias nvim="~/Applications/nvim.appimage"

# alias the shapeworks studio command to shapworks
alias shapeworks="/home/sasank/ShapeWorks-v6.3.0-linux/bin/ShapeWorksStudio"

# Add TeX Live to PATH
export PATH="/usr/local/texlive/2022/bin/x86_64-linux:$PATH"
export PATH="/usr/local/texlive/2023/bin/x86_64-linux:$PATH"

# Alias Emacs
alias emacs="emacsclient -c -a 'emacs'"

# Alias ssh-ing into HiPerGator
alias sshp="ssh sasank.desaraju@hpg.rc.ufl.edu"
# Alias sftp-ing into HiPerGator
alias sfhp="sftp sasank.desaraju@hpg.rc.ufl.edu"

# Alias apt update
alias sad="sudo apt update"
# Alias apt upgrade
alias sag="sudo apt upgrade"

# Alias ls to use exa instead of normal ls
alias ls="exa"
alias ll="exa -l"
alias lt="exa -lasnew"
alias la="exa -la"

# Source .zshrc and .bashrc easily
alias zsource="source ~/.zshrc"
#alias bsource="source ~/.bashrc"

# Run tmux
tmux

# Neofetch
# alias neofetch="neofetch --ascii_colors 129 254 --colors 129 254 30 60 90 150 --ascii_distro Ubuntu_small"
neofetch
# --ascii_distro Ubuntu_small       # to make the distro the small version. Might implement later...

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export MODULAR_HOME="/home/sasank/.modular"
export PATH="/home/sasank/.modular/pkg/packages.modular.com_mojo/bin:$PATH"

# fzf line
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
