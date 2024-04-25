#!/bin/bash
# Check if file name is provided as argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 [FILE]"
    exit 1
fi
# Check if the file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found."
    exit 1
fi
# Read and output the content of the file
while IFS= read -r line; do
  echo "$line"
done < "$1"
