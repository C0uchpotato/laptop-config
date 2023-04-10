#!/usr/bin/env bash
DIR=home/jhelmer/.mozilla/firefox/**.default-release/chrome
#6-18 is dotbot boilerplate
#DO NOT EDIT (without proper knowledge)

set -e

CONFIG="install.conf.yaml"
DOTBOT_DIR="dotbot"

DOTBOT_BIN="bin/dotbot"
BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

cd "${BASEDIR}"
git -C "${DOTBOT_DIR}" submodule sync --quiet --recursive
git submodule update --init --recursive "${DOTBOT_DIR}"

"${BASEDIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -d "${BASEDIR}" -c "${CONFIG}" "${@}"


# Checks if pamanfile is installed from AUR
# Useful for reinstalls

if pacman -Qm | grep "pacmanfile" ; then
	echo "pacmanfile installed"
else
	yay pacmanfile		
fi

#if [ -d "$DIR" ] ; then
#	echo "firefox userChrome.css likely exists"
#else
#	mkdir $DIR

#fi


#installs all programs listed in the "~/.config/pacmanfile/pacmanfile-dumped.txt
pacmanfile sync
