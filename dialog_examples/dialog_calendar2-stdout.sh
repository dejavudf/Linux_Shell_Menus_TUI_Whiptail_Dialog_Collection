#!/bin/sh
# $Id: calendar2-stdout,v 1.6 2010/01/13 10:20:03 tom Exp $

. ./setup-vars

RESULT=`$DIALOG --stdout --title "CALENDAR" "$@" --calendar "Please choose a date..." 0 0`
retval=$?

. ./report-string
