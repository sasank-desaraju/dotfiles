My tmux config is in tmux.conf. It is adapted from oh-my-tmux and other sources.



I am no longer using Oh my tmux and the below is just a record of what I did before:
For Tmux, I want to use Oh my tmux, which is a GitHub maintained at gpakosz/.tmux
Since I'd like to use stow with a GitHub for my dotfiles and don't really want a repo in a repo, I think it'd be best to have the base tmux.conf symlinked from ~/.tmux or ~/.oh-my-tmux or so to ~/.config/tmux/tmux.conf.
At the same time, my personal config edits will be symlinked from ~/dotfiles/.config/tmux/tmux.conf.local to ~/.config/tmux/tmux.conf.local.
