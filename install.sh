#!/bin/bash

cd ~

mkdir -p ~/.dok
cd $_
rm -r ./*

git clone https://github.com/bitliner/dok .


if [ -f /usr/bin/dok ]; then
	sudo rm /usr/bin/dok
fi

sudo ln -vs  "$(pwd)"/dok /usr/bin/dok
