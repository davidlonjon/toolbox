#!/bin/bash
############################
# .symlink_dotfiles.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~toolbox/dotfiles
############################

# Get the OS
OSTYPE=$( uname | tr '[:upper:]' '[:lower:]')

# dotfiles directory
dotfiles_dir="$HOME/toolbox/dotfiles"

# old dotfiles backup directory
dotfiles_backup_dir="$HOME/toolbox/dotfiles/_backup"

e_header "Symlinking dotfiles"

# .zshrc
if [[ -f ~/.zshrc ]]; then
    echo "Moving zshrc dotfile from $HOME to $dotfiles_backup_dir"
    mv ~/.zshrc $dotfiles_backup_dir
fi
echo "Creating symlink to .zshrc in home directory."
ln -s -f $dotfiles_dir/zsh/.zshrc ~/.zshrc

# .gitignore_global
if [[ -f ~/.gitignore_global ]]; then
    echo "Moving gitignore_global dotfile from $HOME to $dotfiles_backup_dir"
    mv ~/.gitignore_global $dotfiles_backup_dir
fi
echo "Creating symlink to .gitignore_global in home directory."
ln -s -f $dotfiles_dir/git/.gitignore_global ~/.gitignore_global

# .gitconfig
if [[ -f ~/.gitconfig ]]; then
    echo "Moving gitconfig dotfile from $HOME to $dotfiles_backup_dir"
    mv ~/.gitconfig $dotfiles_backup_dir
fi
echo "Creating symlink to .gitconfig in home directory."
ln -s -f $dotfiles_dir/git/.gitconfig ~/.gitconfig

# .gitattributes
if [[ -f ~/.gitattributes ]]; then
    echo "Moving gitattributes dotfile from $HOME to $dotfiles_backup_dir"
    mv ~/.gitattributes $dotfiles_backup_dir
fi
echo "Creating symlink to .gitattributes in home directory."
ln -s -f $dotfiles_dir/git/.gitattributes ~/.gitattributes

# .ssh/config
if [[ -f ~/.ssh/config ]]; then
    echo "Moving ssh/config dotfile from $HOME to $dotfiles_backup_dir"
    mv ~/.ssh/config $dotfiles_backup_dir
fi
echo "Creating symlink to config in .ssh directory."
ln -s -f $dotfiles_dir/ssh/config ~/.ssh/config

# .wgetrc
if [[ -f ~/.wgetrc ]]; then
    echo "Moving wgetrc dotfile from $HOME to $dotfiles_backup_dir"
    mv ~/.wgetrc $dotfiles_backup_dir
fi
echo "Creating symlink to .wgetrc in home directory."
ln -s -f $dotfiles_dir/wget/.wgetrc ~/.wgetrc

# .tmux.conf
if [[ -f ~/.tmux.conf ]]; then
    echo "Moving tmux.conf dotfile from $HOME to $dotfiles_backup_dir"
    mv ~/.tmux.conf $dotfiles_backup_dir
fi
echo "Creating symlink to .tmux.conf in home directory."
ln -s -f $dotfiles_dir/tmux/.tmux.conf ~/.tmux.conf

# .screenrc
if [[ -f ~/.screenrc ]]; then
    echo "Moving screenrc dotfile from $HOME to $dotfiles_backup_dir"
    mv ~/.screenrc $dotfiles_backup_dir
fi
echo "Creating symlink to .screenrc in home directory."
ln -s -f $dotfiles_dir/screen/.screenrc ~/.screenrc

# .ctags
if [[ -f ~/.ctags ]]; then
    echo "Moving ctags dotfile from $HOME to $dotfiles_backup_dir"
    mv ~/.ctags $dotfiles_backup_dir
fi
echo "Creating symlink to .ctags in home directory."
ln -s -f $dotfiles_dir/ctags/.ctags ~/.ctags

# .ackrc
if [[ -f ~/.ackrc ]]; then
    echo "Moving ackrc dotfile from $HOME to $dotfiles_backup_dir"
    mv ~/.ackrc $dotfiles_backup_dir
fi
echo "Creating symlink to .ackrc in home directory."
ln -s -f $dotfiles_dir/ack/.ackrc ~/.ackrc