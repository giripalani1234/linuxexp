#!/bin/bash
# Check if correct number of arguments are provided
if [ $# -ne 2 ]; then
echo "Usage: $0 <source> <destination>"
exit 1
fi
# Check if source file exists
if [ ! -e "$1" ]; then
echo "Error: Source file/directory '$1' does not exist."
exit 1
fi
# Check if destination directory exists
if [ ! -d "$(dirname "$2")" ]; then
echo "Error: Destination directory '$(dirname "$2")' does not exist."
exit 1
fi
# Check if destination file already exists
if [ -e "$2" ]; then
echo "Warning: Destination file '$2' already exists. Overwrite? (y/n)"
read -r response
if [ "$response" != "y" ]; then
echo "Operation cancelled."
exit 0
fi
fi
# Perform the move operation
mv "$1" "$2"
echo "File/directory '$1' moved to '$2' successfully."
