#!/bin/bash
# Create a named pipe if it doesn't exist
PIPE="my_pipe"
if [ ! -p $PIPE ]; then
mkfifo $PIPE
fi
# Function to produce data
produce_data()
{
echo "Producing data..."
for i in {1..3}; do
echo "Data $i" > $PIPE
sleep 1 # Simulate some processing time
done
echo "Producer finished producing data."
}
# Main
produce_data
