#!/bin/sh
# $Id: menubox-8bit,v 1.7 2019/12/11 00:02:11 tom Exp $

. ./setup-vars

. ./setup-tempfile

. ./testdata-8bit

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
        "`./rotated-data 0 "$SAMPLE"`"  "The Great Unix Clone for 386/486" \
        "`./rotated-data 1 "$SAMPLE"`" "Another free Unix Clone for 386/486" \
        "`./rotated-data 2 "$SAMPLE"`" "IBM OS/2" \
        "`./rotated-data 3 "$SAMPLE"`" "Microsoft Windows NT" \
        "`./rotated-data 4 "$SAMPLE"`" "IBM PC DOS" \
        "`./rotated-data 5 "$SAMPLE"`" "Microsoft DOS" 2> $tempfile

retval=$?

. ./report-tempfile
