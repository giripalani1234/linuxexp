#!/bin/bash
# Check if filename is provided
if [ -z "$1" ]; then
echo "Usage: $0 [filename]"
exit 1
fi
# Check if file exists
if [ ! -f "$1" ]; then
echo "File '$1' not found."
exit 1
fi
# Output the first 10 lines of the file
head -n 10 "$1"
