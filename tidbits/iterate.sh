#!/usr/bin/env sh

IFS=$(echo -en "\n\b")
for i in `ls -F`
do
	if [[ $i == */ ]]; then
		echo
		echo $i
		sudo cat "${i}Configuration/private/etc/master.passwd.system_default"
	fi
done
