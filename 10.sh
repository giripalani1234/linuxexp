#!/bin/bash

# Function for the child process
child_process() {
echo "Child process created..."  
echo "Displaying from Child Process"
}

# Main script

echo "Parent Running..."
echo "Displaying parent from Parent process"

# Fork the child process
child_process &

# Ensure parent process waits for child to finish before exiting
wait

echo "Parent process is done."
