#!/bin/bash

DIR=~/.config/pacmanfile

#Make pacmanfile dump in github folder
pacmanfile dump >> pacmanfile-dumped.txt

#Make pacmanfile dump on local computer
if [ -d "$DIR" ] ; then
	echo "~/.config/pacmanfile/ exists"
else
	mkdir ~/.config/pacmanfile
fi

#move dump to local computer
cp pacmanfile-dumped.txt ~/.config/pacmanfile/

#git auto commit & push
git add *
git commit -m "refresh"
git push
