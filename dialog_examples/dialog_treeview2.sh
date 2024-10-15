#!/bin/sh
# $Id: treeview2,v 1.4 2019/12/11 01:49:01 tom Exp $

. ./setup-vars

. ./setup-edit

case "x$DIALOGOPTS" in
*--no-items*|*--noitem*)
	CUT="cut -d: -f1,3,4"
	;;
*)
	CUT="cat"
	;;
esac

$CUT >$input <<-EOF
	tag1:one:off:0
	tag2:two:off:1
	tag3:three:on:2
	tag4:four:off:1
	tag5:five:off:2
	tag6:six:off:3
	tag7:seven:off:3
	tag8:eight:off:4
	tag11:1one:off:0
	tag12:1two:off:1
	tag13:1three:on:2
	tag14:1four:off:1
	tag15:1five:off:2
	tag16:1six:off:3
	tag17:1seven:off:3
	tag18:1eight:off:4
	tag21:2one:off:0
	tag22:2two:off:1
	tag23:2three:on:2
	tag24:2four:off:1
	tag25:2five:off:2
	tag26:2six:off:3
	tag27:2seven:off:3
	tag28:2eight:off:4
	tag9:nine:off:1
EOF

$DIALOG --title "TREE VIEW DIALOG" \
	--scrollbar \
	--treeview "TreeView demo" 0 0 10 `sed -e 's/:/ /g' "$input"` 2> $output

retval=$?

tempfile=$output
. ./report-tempfile
