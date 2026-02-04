#!/bin/bash

# Convert text to one word per line
words=$(tr -c 'a-zA-Z' '\n' < input.txt | tr 'A-Z' 'a-z' | grep -v '^$')

# Longest word
longest=$(echo "$words" | awk '{ print length, $0 }' | sort -nr | head -1 | cut -d" " -f2)

# Shortest word
shortest=$(echo "$words" | awk '{ print length, $0 }' | sort -n | head -1 | cut -d" " -f2)

# Average word length
total_len=$(echo "$words" | awk '{ sum += length } END { print sum }')
count=$(echo "$words" | wc -l)
average=$(echo "scale=2; $total_len / $count" | bc)

# Unique words count
unique=$(echo "$words" | sort | uniq | wc -l)

echo "Longest word: $longest"
echo "Shortest word: $shortest"
echo "Average word length: $average"
echo "Total unique words: $unique"
