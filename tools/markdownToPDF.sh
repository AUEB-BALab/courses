#!/usr/bin/env bash
 
FILENAME=`echo "$1" | cut -d'.' -f1`
 
echo $1 "=>" $FILENAME.pdf
markdown $1 > $FILENAME.html
wkhtmltopdf $FILENAME.html $FILENAME.pdf
rm $FILENAME.html
