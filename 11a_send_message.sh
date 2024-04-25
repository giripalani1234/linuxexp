#!/bin/bash

FIFO_FILE="my_fifo"

# Check if FIFO file exists, if not create it
if [ ! -p "$FIFO_FILE" ]; then
    mkfifo "$FIFO_FILE"
fi

# Function for writing data into FIFO
write_to_fifo() {
    while true; do
        echo "Enter your message (type 'exit' to quit): "
        read message
        if [ "$message" == "exit" ]; then
            echo "Exiting..."
            break
        fi
        echo "$message" > "$FIFO_FILE"
    done
}

# Run the write_to_fifo function

write_to_fifo
