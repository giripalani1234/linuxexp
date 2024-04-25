#!/bin/bash

FIFO_FILE="my_fifo"

# Check if FIFO file exists, if not create it
if [ ! -p "$FIFO_FILE" ]; then
    mkfifo "$FIFO_FILE"
fi

# Function for reading data from FIFO
read_from_fifo() {
    while true; do
        if read line < "$FIFO_FILE"; then
            echo "Received message: $line"
        fi
    done
}

# Run the read_from_fifo function
read_from_fifo
