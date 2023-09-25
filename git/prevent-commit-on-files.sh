#!/usr/bin/env zsh

# NOTE: Export MUST_NOT_CHANGE to provide your own list of files
if [ ! -v MUST_NOT_CHANGE ]
then
read -r -d '' MUST_NOT_CHANGE << EOM
	config/database.yml
EOM
fi

if git rev-parse --verify HEAD >/dev/null 2>&1
then
	against=HEAD
else
	# Initial commit: diff against an empty tree object
	# git hash-object -t tree /dev/null produces the same SHA-1 as
	against=4b825dc642cb6eb9a060e54bf8d69288fbee4904
fi

exec 1>&2


if git diff --cached --name-only $against | grep --quiet --line-regexp --fixed-strings "$MUST_NOT_CHANGE"
then
	echo "You have staged a file that should not be modified without great care:"
	echo $(git diff --cached --name-only $against | grep --line-regexp --fixed-strings "$MUST_NOT_CHANGE")
	exit 1
fi
