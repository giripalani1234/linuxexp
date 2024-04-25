#!/bin/bash
# Function to handle SIGINT
sigint_handler() {
echo "Received SIGINT"
exit 1
}
# Function to handle SIGQUIT
sigquit_handler() {
echo "Received SIGQUIT"
exit 1
}
# Function to handle SIGFPE
sigfpe_handler() {
echo "Received SIGFPE"
exit 1
}
# Register signal handlers
trap 'sigint_handler' SIGINT
trap 'sigquit_handler' SIGQUIT
trap 'sigfpe_handler' SIGFPE
echo "Running. Press Ctrl+C to trigger SIGINT or send SIGQUIT or SIGFPE."
# Infinite loop to keep the script running
while true; do
kill -FPE $$
sleep 1
done
