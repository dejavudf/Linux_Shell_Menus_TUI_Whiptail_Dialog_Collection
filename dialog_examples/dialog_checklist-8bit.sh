#! /bin/sh
# $Id: checklist-8bit,v 1.9 2019/12/10 23:35:35 tom Exp $

. ./setup-vars

. ./setup-tempfile

. ./testdata-8bit

$DIALOG --backtitle "No Such Organization" \
	--title "CHECKLIST BOX" "$@" \
        --checklist "Hi, this is a checklist box. You can use this to \n\
present a list of choices which can be turned on or \n\
off. If there are more items than can fit on the \n\
screen, the list will be scrolled. You can use the \n\
UP/DOWN arrow keys, the first letter of the choice as a \n\
hot key, or the number keys 1-9 to choose an option. \n\
Press SPACE to toggle an option on/off. \n\n\
  Which of the following are fruits?" 20 61 5 \
        "`./rotated-data 0 "$SAMPLE"`"  "It's an `./rotated-data 0 "$SAMPLE"`." off \
        "`./rotated-data 1 "$SAMPLE"`"  "No, that's not my `./rotated-data 1 "$SAMPLE"`." ON \
        "`./rotated-data 2 "$SAMPLE"`" "Yeah, that's `./rotated-data 2 "$SAMPLE"`." off \
        "`./rotated-data 3 "$SAMPLE"`"  "Normally not a `./rotated-data 3 "$SAMPLE"`." off \
        "`./rotated-data 4 "$SAMPLE"`"  "No, never put a `./rotated-data 4 "$SAMPLE"` there!" oN \
        "`./rotated-data 5 "$SAMPLE"`"  "Cats like `./rotated-data 5 "$SAMPLE"`." On \
        "`./rotated-data 6 "$SAMPLE"`"  "You `./rotated-data 6 "$SAMPLE"` how it is." on 2> $tempfile

retval=$?

. ./report-tempfile
