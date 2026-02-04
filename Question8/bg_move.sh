#!/bin/bash

# Check argument
if [ $# -ne 1 ]; then
    echo "Error: Please provide a directory path."
    exit 1
fi

DIR="$1"

# Check directory exists
if [ ! -d "$DIR" ]; then
    echo "Error: Directory does not exist."
    exit 1
fi

BACKUP="$DIR/backup"
mkdir -p "$BACKUP"

echo "Parent Process PID: $$"

for file in "$DIR"/*; do
    if [ -f "$file" ]; then
        mv "$file" "$BACKUP/" &
        echo "Moved $(basename "$file") in background with PID: $!"
    fi
done

wait
echo "All background move operations completed."
