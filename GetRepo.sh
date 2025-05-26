#!/bin/bash

usage() {
	echo "Usage: GetRepo [-u <user_name>] <repo_name> [<dest_name>]" >&2
	exit 1
}

USR="JoWatersASC"

#make option for h(host) for different git hosting sites
while getopts "u:h:" opt; do
	case "${opt}" in
		u) 
			USR=${OPTARG}
			echo $USR
			;;
		\?)
			echo "Invalid option: -${OPTARG}" >&2
			usage
			;;
		:)
			echo "Option -${OPTARG} requires argument" >&2
			usage
			;;
		*)
			usage
			;;
	esac
done
shift $((OPTIND-1))

if [[ $# -lt 2 ]]; then 
	usage
fi

path=""
if [[ $# -eq 2 ]]; then
	path="$2"
fi

git clone --recursive https://github.com/$USR/$1 $path
