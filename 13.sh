#!/bin/bash

# Constants
KEY=1234
SIZE=1024

# Function to create shared memory segment
create_shared_memory() {
    # Create shared memory segment using 'ipcrm' command
    ipcrm -M "$KEY" &>/dev/null
    ipcmk -M "$KEY" "$SIZE" || { echo "Failed to create shared memory segment."; exit 1; }
}

# Function to write data into shared memory
write_to_shared_memory() {
    local shm_id="$1"
    local data="$2"
    echo "$data" > "/dev/shm/shm_$shm_id"
}

# Function to read data from shared memory
read_from_shared_memory() {
    local shm_id="$1"
    cat "/dev/shm/shm_$shm_id"
}

# Main
create_shared_memory
# Write data to shared memory
write_to_shared_memory "$KEY" "Hello from shared memory!"
# Read data from shared memory
data=$(read_from_shared_memory "$KEY")
echo "Data read from shared memory: $data"
