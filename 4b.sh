#!/bin/bash

# Function to get the time of day
get_time_of_day() {
    local hour=$(date +%H)
    if [ "$hour" -ge 5 ] && [ "$hour" -lt 12 ]; then
        echo "Morning"
    elif [ "$hour" -ge 12 ] && [ "$hour" -lt 18 ]; then
        echo "Afternoon"
    elif [ "$hour" -ge 18 ] && [ "$hour" -lt 21 ]; then
        echo "Evening"
    else
        echo "Night"
    fi
}

# Get the current time of day
time_of_day=$(get_time_of_day)

# Display the appropriate greeting
echo "Good $time_of_day,Welcome Back $USER!"
