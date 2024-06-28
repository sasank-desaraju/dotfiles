# Sasank's dotfiles

This directory contains the dotfiles for my system which I want to customize and track across devices.

This is handled using GNU Stow, primarily inspired by Dreams of Code through [this video guide](https://www.youtube.com/watch?v=y6XCebnB9gs).
I've also used [this video](https://www.youtube.com/watch?v=CxAT1u8G7is) by System Crafters.
Another great video resource is [here](https://www.youtube.com/watch?v=NoFiYOqnC4o) by typecraft.


## Requirements
Ensure you have the following installed on your system:

### Git

```{bash}
sudo apt install git
```

### Stow

```{bash}
sudo apt install stow
```

## Installation

First, check out the dotfiles repo in your $HOME directory using git

```{bash}
$ git clone git@github.com/sasank-desaraju/dotfiles.git
$ cd dotfiles
```

then use GNU stow to create symlinks

```{bash}
$ stow .
```

## How to use Stow

"Stowing" seems to be taking things inside the source directory and symlinking them outside (by default, the parent directory).
Thus, `stow .` tries to place the tree structure within the `dotfiles` directory in the parent directory (my home directory).
The directories can be explicitly changed, using the syntax `stow -d [stow directory] -t [target directory]`.
So, for my use, I could type longhand `stow -d ~/dotfiles -t ~/`.

Stow will attempt to symlink everything within the stow directory to the target directory.
If a file is already there outside, it will throw an error rather than overwrite that file in the target directory.
If you'd like to update your stow directory file with the external one, the most straight-forward way is to manually delete the stow directory copy and move (`mv`) the target directory one inside before calling stow.
However, you can also run stow with the `--adopt` flag such as `stow . --adopt` and this will overwrite the stow directory files in case of any conflicting files.
Use this with caution.
It is helpful for getting things set up but should not be run on the regular as, once symlinked, changing a file in the target directory will automatically update the copy in the stow directory.


## Things I've customized

Terminal: zsh using oh-my-zsh and p10k.
Tmux config using oh-my-tmux.
`~/.oh-my-tmux/.tmux.conf` is symlinked to `~/.config/tmux/tmux.conf`.
What lives in dotfiles is only my tmux.conf.local, which is symlinked to my tmux conf as well.
This way, I can just git pull my `~/.oh-my-tmux/` repo to update it.

Neovim - I am building my own config starting from Jannik Buhr's Quarto Nvim Kickstart

Emacs - I don't really use Emacs.
I will probably look into that once I am comfortable with my NeoVim.
This is not very time-efficient but I have accepted it and want to do it.
Emacs config is Doom Emacs.
