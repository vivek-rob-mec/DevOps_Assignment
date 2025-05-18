#!/bin/bash

# Check if a file path is given
if [ $# -eq 0 ]; then
    echo "Usage: $0 <filename>"
    exit 1
fi

FILE="$1"

if [ ! -f "$FILE" ]; then
    echo "Error: File '$FILE' not found!"
    exit 1
fi

line_count=$(wc -l < "$FILE")
word_count=$(wc -w < "$FILE")
char_count=$(wc -m < "$FILE")

# Extract the longest word (ignoring punctuation)
longest_word=$(tr -c '[:alnum:]' '[\n*]' < "$FILE" | awk '{ if (length > max) { max = length; longest = $0 } } END { print longest }')

# Output the results
echo "Lines: $line_count"
echo "Words: $word_count"
echo "Characters: $char_count"
echo "Longest word: $longest_word"

