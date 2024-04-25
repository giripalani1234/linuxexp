#!/bin/bash
# Define the port to listen on
PORT=12345
# Start listening on the specified port and echo system date and time
while true; do
echo "$(date)" | nc -l -p $PORT
done
