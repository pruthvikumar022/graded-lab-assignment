#!/bin/bash

# Check if exactly one argument is given
if [ $# -ne 1 ]; then
    echo "Error: Please provide exactly one argument (file or directory)."
    exit 1
fi

# Check if path exists
if [ ! -e "$1" ]; then
    echo "Error: The given path does not exist."
    exit 1
fi

# If argument is a file
if [ -f "$1" ]; then
    echo "The given path is a file."
    echo "Lines Words Characters"
    wc "$1"

# If argument is a directory
elif [ -d "$1" ]; then
    echo "The given path is a directory."
    echo "Total number of files:"
    find "$1" -type f | wc -l

    echo "Number of .txt files:"
    find "$1" -type f -name "*.txt" | wc -l
fi
