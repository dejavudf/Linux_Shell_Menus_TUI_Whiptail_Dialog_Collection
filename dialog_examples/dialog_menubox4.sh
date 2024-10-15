#!/bin/sh
# $Id: menubox4,v 1.9 2019/12/10 23:16:31 tom Exp $

. ./setup-vars

. ./setup-tempfile

$DIALOG --clear --item-help --title "MENU BOX" "$@" \
        --menu "Hi, this is a menu box. You can use this to \n\
present a list of choices for the user to \n\
choose. If there are more items than can fit \n\
on the screen, the menu will be scrolled. \n\
You can use the UP/DOWN arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
number keys 1-9 to choose an option.\n\
Try it now!\n\n\
          Choose the OS you like:" 20 51 4 \
        "Linux"  "The Great Unix Clone for 386/486 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"    "Why use Linux?" \
        "NetBSD" "Another free Unix Clone for 386/486 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx" "Or NetBSD?" \
        "OS/2"   "IBM OS/2 xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"                            "aka \"Warp\"" \
        "WIN NT" "Microsoft Windows NT xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"                "hmm" \
        "PC-DOS" "IBM PC DOS xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"                          "clone of a clone" \
        "MS-DOS" "Microsoft DOS xxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"                       "DOS: Disk Operating System, originally for an IBM contract, hence using the same jargon" 2> $tempfile

retval=$?

. ./report-tempfile
