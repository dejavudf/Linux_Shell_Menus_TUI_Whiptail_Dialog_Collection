#!/bin/sh
# $Id: menubox6,v 1.9 2019/12/10 23:19:16 tom Exp $
# example showing the --colors option

. ./setup-vars

. ./setup-tempfile

$DIALOG --clear --item-help --title "MENU BOX" --colors "$@" \
        --menu "Hi, this is a \Zumenu\Zn box. You can use this to \n\
present a list of choices for the user to \n\
choose. If there are more items than can fit \n\
on the screen, the menu will be scrolled. \n\
You can use the \Z4UP/DOWN\Zn arrow keys, the first \n\
letter of the choice as a hot key, or the \n\
\Z2number\Zn keys 1-9 to choose an option.\n\
Try it now!\n\n\
          Choose the OS you like:" 20 51 4 \
        "Linux"  "The Great Unix Clone for \Zu386/486"    "Why use \ZbLinux?" \
        "NetBSD" "Another free Unix Clone for \Zu386/486" "Or \ZbNetBSD?" \
        "OS/2"   "IBM OS/2"                            "aka \"Warp\"" \
        "WIN NT" "Microsoft Windows NT"                "hmm" \
        "PC-DOS" "IBM PC \ZrDOS"                       "clone of a clone" \
        "MS-DOS" "Microsoft \ZrDOS"                    "\ZbDOS\Zn: \Zb\Z3D\Znisk \Zb\Z3O\Znperating \Zb\Z3S\Znystem, originally for an IBM contract, hence using the same jargon" 2> $tempfile

retval=$?

. ./report-tempfile
