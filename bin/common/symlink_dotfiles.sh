#!/bin/bash
############################
# .symlink_dotfiles.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~toolbox/dotfiles
############################

# Get the OS
OSTYPE=$( uname | tr '[:upper:]' '[:lower:]')

# dotfiles directory
dotfiles_dir="$HOME/toolbox/dotfiles"

# private dotfiles directory
private_dotfiles_dir="$HOME/toolbox/private/dotfiles"

# old dotfiles backup directory
dotfiles_backup_dir="$HOME/toolbox/dotfiles/_backup"

e_header "Symlinking dotfiles"

# .zshrc
if [[ -f ~/.zshrc ]]; then
    echo "Moving zshrc dotfile from $HOME to $dotfiles_backup_dir"
    rm -f $dotfiles_backup_dir/.zshrc
    cp ~/.zshrc $dotfiles_backup_dir
    rm -f ~/.zshrc
fi
echo "Creating symlink to .zshrc in home directory."
ln -s -f $dotfiles_dir/zsh/.zshrc ~/.zshrc

# .gitignore_global
if [[ -f ~/.gitignore_global ]]; then
    echo "Moving gitignore_global dotfile from $HOME to $dotfiles_backup_dir"
    rm -f $dotfiles_backup_dir/.gitignore_global
    cp ~/.gitignore_global $dotfiles_backup_dir
    rm -f ~/.gitignore_global
fi
echo "Creating symlink to .gitignore_global in home directory."
ln -s -f $dotfiles_dir/git/.gitignore_global ~/.gitignore_global

# .gitconfig
if [[ -f ~/.gitconfig ]]; then
    echo "Moving gitconfig dotfile from $HOME to $dotfiles_backup_dir"
    rm -f $dotfiles_backup_dir/.gitconfig
    cp ~/.gitconfig $dotfiles_backup_dir
    rm -f ~/.gitconfig
fi
echo "Creating symlink to .gitconfig in home directory."
ln -s -f $dotfiles_dir/git/.gitconfig ~/.gitconfig

# .gitattributes
if [[ -f ~/.gitattributes ]]; then
    echo "Moving gitattributes dotfile from $HOME to $dotfiles_backup_dir"
    rm -f $dotfiles_backup_dir/.gitattributes
    cp ~/.gitattributes $dotfiles_backup_dir
    rm -f ~/.gitattributes
fi
echo "Creating symlink to .gitattributes in home directory."
ln -s -f $dotfiles_dir/git/.gitattributes ~/.gitattributes

# .ssh/config
if [[ -f ~/.ssh/config ]]; then
    echo "Moving ssh/config dotfile from $HOME to $dotfiles_backup_dir"
    rm -f $dotfiles_backup_dir/config
    cp ~/.ssh/config $dotfiles_backup_dir
    rm -f ~/.ssh/config
fi
echo "Creating symlink to config in .ssh directory."
ln -s -f $private_dotfiles_dir/ssh/config ~/.ssh/config

# .wgetrc
if [[ -f ~/.wgetrc ]]; then
    echo "Moving wgetrc dotfile from $HOME to $dotfiles_backup_dir"
    rm -f $dotfiles_backup_dir/.wgetrc
    cp ~/.wgetrc $dotfiles_backup_dir
    rm -f ~/.wgetrc
fi
echo "Creating symlink to .wgetrc in home directory."
ln -s -f $dotfiles_dir/wget/.wgetrc ~/.wgetrc

# .tmux.conf
if [[ -f ~/.tmux.conf ]]; then
    echo "Moving tmux.conf dotfile from $HOME to $dotfiles_backup_dir"
    rm -f $dotfiles_backup_dir/.tmux.conf
    cp ~/.tmux.conf $dotfiles_backup_dir
    rm -f ~/.tmux.conf
fi
echo "Creating symlink to .tmux.conf in home directory."
ln -s -f $dotfiles_dir/tmux/.tmux.conf ~/.tmux.conf

# .screenrc
if [[ -f ~/.screenrc ]]; then
    echo "Moving screenrc dotfile from $HOME to $dotfiles_backup_dir"
    rm -f $dotfiles_backup_dir/.screenrc
    cp ~/.screenrc $dotfiles_backup_dir
    rm -f ~/.screenrc
fi
echo "Creating symlink to .screenrc in home directory."
ln -s -f $dotfiles_dir/screen/.screenrc ~/.screenrc

# .ctags
if [[ -f ~/.ctags ]]; then
    echo "Moving ctags dotfile from $HOME to $dotfiles_backup_dir"
    rm -f $dotfiles_backup_dir/.ctags
    cp ~/.ctags $dotfiles_backup_dir
    rm -f ~/.ctags
fi
echo "Creating symlink to .ctags in home directory."
ln -s -f $dotfiles_dir/ctags/.ctags ~/.ctags

# .ackrc
if [[ -f ~/.ackrc ]]; then
    echo "Moving ackrc dotfile from $HOME to $dotfiles_backup_dir"
    rm -f $dotfiles_backup_dir/.ackrc
    cp ~/.ackrc $dotfiles_backup_dir
    rm -f ~/.ackrc
fi
echo "Creating symlink to .ackrc in home directory."
ln -s -f $dotfiles_dir/ack/.ackrc ~/.ackrc

# .dir_colors
if [[ -f ~/.dir_colors ]]; then
    echo "Moving dir_colors config files from $HOME to $dotfiles_backup_dir"
    rm -f $dotfiles_backup_dir/.dir_colors
    cp ~/.dir_colors $dotfiles_backup_dir
    rm -f ~/.dir_colors
fi
echo "Creating symlink to .dir_colors in home directory."
ln -s -f $dotfiles_dir/dir_colors/.dir_colors ~/.dir_colors

# .gemrc
if [[ -f ~/.gemrc ]]; then
    echo "Moving gemrc config files from $HOME to $dotfiles_backup_dir"
    rm -f $dotfiles_backup_dir/.gemrc
    cp ~/.gemrc $dotfiles_backup_dir
    rm -f ~/.gemrc
fi
echo "Creating symlink to .gemrc in home directory."
ln -s -f $dotfiles_dir/gemrc/.gemrc ~/.gemrc
