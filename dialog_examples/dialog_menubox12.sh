#!/bin/sh
# $Id: menubox12,v 1.5 2019/12/10 23:57:12 tom Exp $

. ./setup-vars

. ./setup-edit

case "x$DIALOGOPTS" in
*--no-items*|*--noitem*)
	CUT="cut -d: -f1,3"
	;;
*)
	CUT="cat"
	;;
esac

$CUT >$input <<-EOF
	Linux:The Great Unix Clone for 386/486
	NetBSD:Another free Unix Clone for 386/486
	OS/2:IBM OS/2
	WIN NT:Microsoft Windows NT
	PC-DOS:IBM PC DOS
	MS-DOS:Microsoft DOS
EOF
sed -e 's/^/"/' -e 's/:/" "/g' -e 's/$/"/' <$input >$output
cat $output >$input

$DIALOG --clear --title "MENU BOX" "$@" \
        --menu "Hi, this is a menu box. You can use this to \n\
present a list of choices for the user to \n\
choose. If there are more items than can fit \n\
on the screen, the menu will be scrolled. \n\
You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Try it now!\n\n\
	Choose the OS you like:" 20 51 4 \
	--file $input 2> $output

retval=$?

tempfile=$output
. ./report-tempfile
