#!/bin/sh
# $Id: fselect1,v 1.10 2019/12/10 23:37:10 tom Exp $

. ./setup-vars

FILE=$HOME
for n in .cshrc .profile .bashrc
do
	if test -f "$HOME/$n" ; then
		FILE=$HOME/$n
		break
	fi
done

exec 3>&1
RESULT=`$DIALOG --title "Please choose a file" "$@" --fselect "$FILE" 14 48 2>&1 1>&3`
retval=$?
exec 3>&-

. ./report-string
