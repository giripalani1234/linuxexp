#!/bin/bash

echo "Parent process $$ is starting..."

# Define a function for the child process
child_process() {
  echo "Child process $BASHPID is starting..."
  sleep 5
  echo "Child process $BASHPID is done."
}

# Start the child process in the background
child_process &

# Intentionally wait indefinitely without handling the child process termination
while true; do
    sleep 1
done

echo "Parent process $$ is continuing..."
