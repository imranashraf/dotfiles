#!/bin/bash
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles

dir=~/dotfiles # dotfiles directory
olddir=~/dotfiles_old # old dotfiles backup directory

# setup of conky is based on number of cores
nproc=`grep -c ^processor /proc/cpuinfo`
mv ~/.conkyrc ~/dotfiles_old/
ln -s $dir/conkyrc$nproc ~/.conkyrc

# list of files/folders to symlink in homedir
files="bash_aliases bashrc DIR_COLORS gitconfig gitignore_global vimrc tmux.conf"

# create dotfiles_old in homedir
echo -n "Creating [$olddir] for backup of any existing dotfiles in ~ ..."
mkdir -p $olddir
echo "Done"

# change to the dotfiles directory
echo -n "Changing to the [$dir] directory ..."
cd $dir
echo "Done"

# move any existing dotfiles in homedir to dotfiles_old directory,
# then create symlinks from the homedir to any files in the ~/dotfiles
# directory specified in $files
for file in $files;
do
    echo "Moving any existing [$file] from homedir to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to [$file] in home directory."
    ln -s $dir/$file ~/.$file
done

# miscelleneous configurations
mkdir -p ~/.gconf/apps
mkdir -p ~/.config

#name=guake
#loc=~/.gconf/apps
#echo "Setting up [$name] configuration"
#if [[ -d "$loc/$name"  && ! -L "$loc/$name" ]];
#then
    #mv -f $loc/$name ~/dotfiles_old/
#fi
#if [ ! -L "$loc/$name" ];
#then
    #ln -s $dir/$name $loc/
#fi

name=ranger
loc=~/.config
echo "Setting up [$name] configuration"
if [[ -d "$loc/$name"  && ! -L "$loc/$name" ]];
then
    mv -f $loc/$name ~/dotfiles_old/
fi
if [ ! -L "$loc/$name" ];
then
    ln -s $dir/$name $loc/
fi

name=.vim
loc=~
echo "Setting up [$name] configuration"
if [[ -d "$loc/$name"  && ! -L "$loc/$name" ]];
then
    mv -f $loc/$name ~/dotfiles_old/
fi
if [ ! -L "$loc/$name" ];
then
    ln -s $dir/vim $loc/$name
fi

name=.vifm
loc=~
echo "Setting up [$name] configuration"
if [[ -d "$loc/$name"  && ! -L "$loc/$name" ]];
then
    mv -f $loc/$name ~/dotfiles_old/
fi
if [ ! -L "$loc/$name" ];
then
    ln -s $dir/vifm $loc/$name
fi


# setup Templates
echo "Setting up Templates"
mkdir -p Templates
mkdir -p ~/dotfiles_old/Templates
mv -f ~/Templates/Development ~/dotfiles_old/Templates
mv -f ~/Templates/MSOffice ~/dotfiles_old/Templates
mv -f ~/Templates/OpenOffice ~/dotfiles_old/Templates
cp -r Templates/* ~/Templates/

cp ssh/config ~/.ssh/config

#icon file for python brighness script
cp ./scripts/brightness_py.desktop ~/.local/share/applications/.

