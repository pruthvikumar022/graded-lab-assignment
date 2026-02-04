#!/bin/bash

DIRA="dirA"
DIRB="dirB"

echo "Files only in dirA:"
ls "$DIRA" | grep -vxFf <(ls "$DIRB")

echo
echo "Files only in dirB:"
ls "$DIRB" | grep -vxFf <(ls "$DIRA")

echo
echo "Common files comparison:"

for file in $(ls "$DIRA")
do
    if [ -f "$DIRB/$file" ]; then
        if cmp -s "$DIRA/$file" "$DIRB/$file"; then
            echo "$file : SAME content"
        else
            echo "$file : DIFFERENT content"
        fi
    fi
done
