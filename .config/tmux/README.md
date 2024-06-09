For Tmux, I want to use Oh my tmux, which is a GitHub maintained at gpakosz/.tmux
Since I'd like to use stow with a GitHub for my dotfiles and don't really want a repo in a repo, I think it'd be best to have the base tmux.conf symlinked from ~/.tmux or ~/.oh-my-tmux or so to ~/.config/tmux/tmux.conf.
At the same time, my personal config edits will be symlinked from ~/dotfiles/.config/tmux/tmux.conf.local to ~/.config/tmux/tmux.conf.local.
