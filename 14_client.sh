#!/bin/bash
# Define the server address and port
SERVER="localhost"
PORT=12345
# Connect to the server and receive system date and time
nc $SERVER $PORT
