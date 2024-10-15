#!/bin/sh
# $Id: fselect2-stdout,v 1.7 2019/12/10 23:37:10 tom Exp $

. ./setup-vars

RESULT=`$DIALOG --stdout --title "Please choose a file" "$@" --fselect "$HOME/" 0 0`
retval=$?

. ./report-string
