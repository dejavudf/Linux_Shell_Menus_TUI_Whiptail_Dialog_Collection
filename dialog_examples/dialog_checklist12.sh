#! /bin/sh
# $Id: checklist12,v 1.4 2019/12/10 23:35:59 tom Exp $

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
	Apple:It's an apple.:off
	Dog:No, that's not my dog.:ON
	Orange:Yeah, that's juicy.:off
	Chicken:Normally not a pet.:off
	Cat:No, never put a dog and a cat together!:oN
	Fish:Cats like fish.:On
	Lemon:You know how it tastes.:on
EOF
sed -e 's/^/"/' -e 's/:/" "/g' -e 's/$/"/' <$input >$output
cat $output >$input

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
	--file $input 2> $output

retval=$?

tempfile=$output
. ./report-tempfile
