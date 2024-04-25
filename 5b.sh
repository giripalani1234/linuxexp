#!/bin/bash
# Check if correct number of arguments are provided
if [ $# -ne 2 ]; then
echo "Usage: $0 <source_file> <destination_file>"
exit 1
fi
# Check if source file exists
if [ ! -f "$1" ]; then
echo "Error: Source file '$1' does not exist."
exit 1
fi
# Copy the source file to the destination
cp "$1" "$2"
# Check if copy operation was successful
if [ $? -eq 0 ]; then
echo "File '$1' copied to '$2' successfully."
else
echo "Error: Failed to copy file '$1' to '$2'."
fi
