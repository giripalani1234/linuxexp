#!/bin/bash
if [ $# -eq 0 ]; then
echo "Usage: $0 <filename>"
exit 1
fi
filename="$1"
if [ ! -f "$filename" ]; then
echo "Error: File '$filename' not found."
exit 1
fi
awk '{ print NR, $0 }' "$filename"
