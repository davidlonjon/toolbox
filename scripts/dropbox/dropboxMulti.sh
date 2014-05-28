#! /bin/bash
sleep 15

dropboxes=".dropbox_perso"
for dropbox in $dropboxes
  do

	HOME=/home/$USER
	if ! [ -d $HOME/$dropbox ];then
		mkdir $HOME/$dropbox #2> /dev/null
		ln -s $HOME/.Xauthority $HOME/$dropbox/ #2> /dev/null
      	fi

	HOME=$HOME/$dropbox
	$HOME/.dropbox-dist/dropboxd & #2> /dev/null &
  done
