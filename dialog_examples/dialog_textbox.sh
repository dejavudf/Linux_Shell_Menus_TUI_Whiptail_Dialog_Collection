#!/bin/sh
# $Id: textbox,v 1.13 2019/12/11 00:04:59 tom Exp $

. ./setup-vars

. ./setup-tempfile

cat << EOF > $tempfile
Hi, this is a text dialog box. It can be used to display text from a file.
The file should not contain any 'tab' characters, so you should 'expand'
the file first if it contains 'tab' characters.

It's like a simple text file viewer, with these keys implemented:

PGDN/SPACE     - Move down one page
PGUP/'b'       - Move up one page
ENTER/DOWN/'j' - Move down one line
UP/'k'         - Move up one line
LEFT/'h'       - Scroll left
RIGHT/'l'      - Scroll right
'0'            - Move to beginning of line
HOME/'g'       - Move to beginning of file
END/'G'        - Move to end of file
'/'            - Forward search
'?'            - Backward search
'n'            - Repeat last search (forward)
'N'            - Repeat last search (backward)


The following is a sample text file:


EOF

TEXT=/usr/share/common-licenses/GPL
test -f $TEXT || TEXT=../COPYING

expand < $TEXT >> $tempfile

$DIALOG --clear --title "TEXT BOX" "$@" --textbox "$tempfile" 22 77

retval=$?

. ./report-button
