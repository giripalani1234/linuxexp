#!/bin/bash

# Function to convert time to seconds since epoch
convert_to_seconds() {
    local time_string="$1"
    date -d "$time_string" +%s
}

# Check if user provided a time argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <time>"
    exit 1
fi

# Convert provided time argument to seconds since epoch
specified_time=$(convert_to_seconds "$1")

# Get list of currently logged in users
logged_in_users=$(who | awk '{print $1}')

# Loop through each logged in user
for user in $logged_in_users; do
    # Get login time of the user
    login_time=$(who | awk -v user="$user" '$1 == user {print $4}')
    login_seconds=$(convert_to_seconds "$login_time")
   
    # Check if user logged in after specified time
    if [ "$login_seconds" -ge "$specified_time" ]; then
        echo "$user"
    fi
done
