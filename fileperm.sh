#!/bin/bash
# This script checks if a file has read, write, and execute permissions

# Check if a file argument is provided
if [ -z "$1" ]; then
	    echo "Usage: $0 filename"
	        exit 1
fi

# Get the file name from the argument
FILE=$1

# Check if the file exists
if [ ! -e "$FILE" ]; then
	    echo "File does not exist."
	        exit 1
fi

# Check read permission
if [ -r "$FILE" ]; then
	    echo "The file has read permission."
    else
	        echo "The file does not have read permission."
fi

# Check write permission
if [ -w "$FILE" ]; then
	    echo "The file has write permission."
    else
	        echo "The file does not have write permission."
fi

# Check execute permission
if [ -x "$FILE" ]; then
	    echo "The file has execute permission."
    else
	        echo "The file does not have execute permission."
fi
