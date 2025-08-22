#!/bin/bash


if [ $# -eq 0 ]; then
    echo "usage: $0 [file]"
    exit 1
fi

FILE=$1

if [ ! -f "$FILE" ]; then
    echo "ERROR: $FILE not found or not a regular file"
    exit 1
fi

OWNER=$(ls -l "$FILE" | awk '{print $3}')
SIZE=$(ls -lh "$FILE" | awk '{print $5}')
MONTH=$(ls -l "$FILE" | awk '{print $6" "$7}')
TIME=$(ls -l "$FILE" | awk '{print $8}')


echo "file name = $FILE"
echo
echo "owner : $OWNER"
echo "size : $SIZE"
echo "this file was created on $MONTH at $TIME"
echo "file type : $(file "$FILE")"
echo
echo "permission:"


[ -r "$FILE" ] && echo "READABLE = TRUE" || echo "READABLE = FALSE"
[ -w "$FILE" ] && echo "WRITABLE = TRUE" || echo "WRITABLE = FALSE"
[ -x "$FILE" ] && echo "EXECUTABLE = TRUE" || echo "EXECUTABLE = FALSE"

