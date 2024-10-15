#!/bin/sh
# $Id: menubox2,v 1.8 2019/12/10 23:16:18 tom Exp $

. ./setup-vars

. ./setup-tempfile

$DIALOG --default-item "MS-DOS" --clear --title "MENU BOX" "$@" \
        --menu "Hi, this is a menu box. You can use this to \n\
present a list of choices for the user to \n\
choose. If there are more items than can fit \n\
on the screen, the menu will be scrolled. \n\
You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Try it now!\n\n\
          Choose the OS you like:" 20 51 4 \
        "Linux"  "The Great Unix Clone for 386/486" \
        "NetBSD" "Another free Unix Clone for 386/486" \
        "OS/2"   "IBM OS/2" \
        "WIN NT" "Microsoft Windows NT" \
        "PC-DOS" "IBM PC DOS" \
        "MS-DOS" "Microsoft DOS" 2> $tempfile

retval=$?

. ./report-tempfile
