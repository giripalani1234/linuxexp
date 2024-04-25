#!/bin/bash

# Check if the correct number of arguments are provided
if [ $# -lt 2 ]; then
    echo "Usage: $0 <file1> <file2> ... <fileN> <destination_directory>"
    exit 1
fi

# Get the destination directory (the last argument)
destination="${@: -1}"

# Check if the destination directory exists
if [ ! -d "$destination" ]; then
    echo "Destination directory does not exist."
    exit 1
fi

# Loop through all arguments (except the last one) which are files
for ((i=1; i<=$#-1; i++)); do
    file="${!i}" # Get the file at position i

    # Check if the file exists
    if [ -f "$file" ]; then
        mv "$file" "$destination" # Move the file to the destination directory
        echo "Moved $file to $destination"
    else
        echo "File $file does not exist."
    fi
done

echo "All specified files have been moved to $destination"
