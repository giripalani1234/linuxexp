#!/bin/bash
# Define the directory for message queue files
MESSAGE_QUEUE_DIR="/tmp/message_queue"
# Ensure message queue directory exists
mkdir -p "$MESSAGE_QUEUE_DIR" || { echo "Error: Unable to create message queue directory"; exit 1; }
# Function to send a message to the queue
send_message() {
local message="$1"
local file="$(mktemp "$MESSAGE_QUEUE_DIR/message_XXXXXX")"
echo "$message" > "$file" || { echo "Error: Unable to send message"; exit 1; }
}
# Function to receive a message from the queue
receive_message() {
local oldest_file=$(ls -t "$MESSAGE_QUEUE_DIR" | grep -E '^message_' | head -n 1)
if [ -n "$oldest_file" ]; then
local message=$(cat "$MESSAGE_QUEUE_DIR/$oldest_file" | cut -d':' -f2-)
rm "$MESSAGE_QUEUE_DIR/$oldest_file"
echo "$message"
else
echo "No messages in the queue."
fi
}
# Send a couple of messages
send_message "Hello from Process 1"
send_message "Hello from Process 2"
# Receive and display messages
echo "Process 1 received: $(receive_message)"
echo "Process 1 received: $(receive_message)"
