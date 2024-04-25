#!/bin/bash
# Check if filename is provided
if [ -z "$1" ]; then
echo "Usage: $0 filename"
exit 1
fi
filename=$1
# Check if file exists
if [ ! -f "$filename" ]; then
echo "File '$filename' does not exist."
exit 1
fi
# Default number of lines to display
num_lines=10
# Check if number of lines is provided
if [ ! -z "$2" ]; then
num_lines=$2
fi
# Display last part of the file
tail -n $num_lines "$filename"
