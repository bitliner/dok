#!/bin/bash

cd ~

mkdir .dok
cd $_

git clone https://github.com/bitliner/dok .


if [ -f /usr/bin/dok ]; do
	rm /usr/bin/dok	
fi

sudo ln -vs  ./dok /usr/bin/dok
