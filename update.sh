#!/bin/bash
#
pacmanfile dump >> pacmanfile-dumped.txt
git add *
git commit -m "refresh"
git push
