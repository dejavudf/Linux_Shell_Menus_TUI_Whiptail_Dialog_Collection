#! /bin/sh
# $Id: form1,v 1.15 2011/10/04 23:36:53 tom Exp $

. ./setup-vars

DIALOG_ERROR=254
export DIALOG_ERROR

backtitle="An Example for the use of --form:"

ids=`id|sed -e 's/([^)]*)//g'`
uid=`echo "$ids" | sed -e 's/^uid=//' -e 's/ .*//'`
gid=`echo "$ids" | sed -e 's/^.* gid=//' -e 's/ .*//'`

user="$USER"
home="$HOME"

returncode=0
while test $returncode != 1 && test $returncode != 250
do
exec 3>&1
value=`$DIALOG --ok-label "Submit" \
	  --backtitle "$backtitle" "$@" \
	  --form "Here is a possible piece of a configuration program." \
20 50 0 \
	"Username:" 1 1	"$user" 1 10 10 0 \
	"UID:"      2 1	"$uid"  2 10  8 0 \
	"GID:"      3 1	"$gid"  3 10  8 0 \
	"HOME:"     4 1	"$home" 4 10 40 0 \
2>&1 1>&3`
returncode=$?
exec 3>&-

show=`echo "$value" |sed -e 's/^/	/'`

	case $returncode in
	$DIALOG_CANCEL)
		"$DIALOG" \
		--clear \
		--backtitle "$backtitle" \
		--yesno "Really quit?" 10 30
		case $? in
		$DIALOG_OK)
			break
			;;
		$DIALOG_CANCEL)
			returncode=99
			;;
		esac
		;;
	$DIALOG_OK)
		"$DIALOG" \
		--clear \
		--backtitle "$backtitle" --no-collapse --cr-wrap \
		--msgbox "Resulting data:\n\
$show" 10 40
		;;
	$DIALOG_HELP)
		echo "Button 2 (Help) pressed."
		exit
		;;
	$DIALOG_EXTRA)
		echo "Button 3 (Extra) pressed."
		exit
		;;
	$DIALOG_ERROR)
		echo "ERROR!$value"
		exit
		;;
	$DIALOG_ESC)
		echo "ESC pressed."
		exit
		;;
	*)
		echo "Return code was $returncode"
		exit
		;;
	esac
done
