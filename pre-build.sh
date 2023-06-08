#!/bin/sh

git clone git@github.com:ShellTux/dotfiles.git \
	./pre-build/airootfs/home/user/.config
git clone git@github.com:ShellTux/shell-scripts.git \
	./pre-build/airootfs/home/user/.local/share
