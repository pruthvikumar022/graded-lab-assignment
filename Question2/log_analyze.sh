#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: $0 logfile"
    exit 1
fi

if [ ! -r "$1" ]; then
    echo "Error: File not readable or does not exist"
    exit 1
fi

total=$(wc -l < "$1")
info=$(grep -c " INFO " "$1")
warning=$(grep -c " WARNING " "$1")
error=$(grep -c " ERROR " "$1")

last_error=$(grep " ERROR " "$1" | tail -n 1)

date=$(date +%Y-%m-%d)
report="logsummary_$date.txt"

{
echo "Total entries: $total"
echo "INFO: $info"
echo "WARNING: $warning"
echo "ERROR: $error"
echo "Most recent ERROR:"
echo "$last_error"
} > "$report"

cat "$report"
