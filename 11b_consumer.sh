#!/bin/bash
# Ensure the named pipe exists
PIPE="my_pipe"
if [ ! -p $PIPE ]; then
echo "Named pipe $PIPE does not exist. Please run the producer script first."
exit 1
fi
# Function to consume data
consume_data() {
echo "Consuming data..."
while read line; do
echo "Received: $line"
done < $PIPE
echo "Consumer finished consuming data."
}
# Main
consume_data
