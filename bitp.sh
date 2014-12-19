#!/usr/bin/env bash

###

function ask_user_server_ip {
	echo -e "Which server?\n" >&2
	#read -p $1 in
	local COUNTER=1
	while read line; do
		echo -e $COUNTER"\t"$line >&2
		COUNTER=$(($COUNTER + 1))
	done < .servers
	read -p "Enter filename: " SERVER_NUMBER
	local SERVER_IP=`cat .servers|head -n $SERVER_NUMBER|tail -n 1|awk '{print $2;}'`
	echo "$SERVER_IP"
}

### COMMANDS


function server_add {
	echo 'Server name?'
	read server_name
	echo 'Server ip?'
	read server_ip
	echo -e "Adding:\t"$server_name"\t"$server_ip
	echo -e $server_name"\t"$server_ip >> .servers
}
function app_add {
	echo $1 $2
	APP_NAME=$1
	echo -e "Creating app called...$APP_NAME"
	local IP=$(ask_user_server_ip)
	echo "Connecting to...$IP"
	PROJECT_FOLDER_VAR='\$PROJECT_FOLDER'
	HOME_VAR='$HOME'
	ssh -T ubuntu@$IP << EOF
		echo "Creating repositories folder..."
		mkdir -p ~/repositories/$APP_NAME.git
		cd ~/repositories/$APP_NAME.git
		pwd
		if [ ! -d "hooks" ]; then
			git init --bare
			echo '#!/bin/bash' > hooks/post-receive
			echo "PROJECT_FOLDER="$HOME_VAR"/apps/"$APP_NAME >> hooks/post-receive
			echo "GIT_WORK_TREE="$PROJECT_FOLDER_VAR" git checkout -f" >> hooks/post-receive
			chmod +x hooks/post-receive
		fi
		cd ~/
		echo "Creating app folder..."
		mkdir -p ~/apps/$APP_NAME
EOF
}

# RUN COMMAND
${1}_${2} ${*:3}
