#!/bin/bash

cd ~

sudo rm -r ~/.dok
mkdir -p ~/.dok
cd $_

git clone https://github.com/bitliner/dok .


if [ -f /usr/bin/dok ]; then
	sudo rm /usr/bin/dok
fi

sudo ln -vs  "$(pwd)"/dok /usr/bin/dok
