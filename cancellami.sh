#!/bin/bash

function a {
	if [ -z "$1" ]; then
		echo 'empty'
		return 
	fi
	echo 'ola'
	echo $1
}

a 
