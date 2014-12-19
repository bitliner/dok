# dok

dok is a simple Platform as a Service.

It is based on Docker, bash, git, ssh and driven by simplicity of the architecture and ease of use.

I did not want to add higher level tools or library, in order to make it flexible and easy to customize. 

# Drivers

1. create easily remote repository and corresponding working tree (using a standard folder tree structure)
2. manage easily git hook automatically integrate docker workflow
3. automatically integrate docker workflow into the git-push workflow

# Standard workflow

## Create and deploy an app on a server (draft)

1. `cd` in root of your app
2. write *Dockerfile*
3. `bitp app add <app-name> <server-name>` to create an app on your server
4. `bitp app deploy <app-name> <server-name>`

## How to set env variables up

* each env variable is related to a certain app-name
* run `bitp app set <var name> <var value> <app-name>` 

### Notes (draft)

#### kjk

Step 4 will basically run `git push ...` and the remote hook will be executed.
The hook will run:
1. docker build
2. docker stop
3. docker start

#### How env variables setting works

* each variable is related to a certain app-name 
* every time you run command `app set`, it uploads config to the server (** is it true? which one???you should specify the value **)

# Commands

## Add server
`bitp server add <server-name> <server-ip> <user>`
## Remove server
`bitp server rm <server-name> <server-ip>`
## Set app up on server
`bitp add app <app-name> <server-name>`
## Add remote
`bitp remote add <server-name>`
## Remote remote
`bitp  remote rm <server-name>`

# Implementation

## add server
Just echo to a file data about server (user and ip).
## Add remote
Just add a git remote to your repo
## Release
git push + settings 

# Bibliography

1. https://github.com/octohost/octohost/blob/3ae5abbec0be46ecdbd357611c66392d4f4158fd/bin/receiver.sh





