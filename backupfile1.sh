#!/bin/bash
# This script backs up all .txt files from a given directory to a backup directory with a timestamp

# Check if the correct number of arguments is provided
if [ "$#" -ne 1 ]; then
	    echo "Usage: $0 <directory>"
	        exit 1
fi

# Set the source directory from the argument
SOURCE_DIR="$1"

# Check if the source directory exists
if [ ! -d "$SOURCE_DIR" ]; then
	    echo "The directory $SOURCE_DIR does not exist."
	        exit 1
fi

# Create a timestamp
TIMESTAMP=$(date +"%Y%m%d%H%M%S")

# Set the backup directory
BACKUP_DIR="$SOURCE_DIR/backup_$TIMESTAMP"

# Create the backup directory
mkdir -p "$BACKUP_DIR"

# Use find to copy only .txt files and exclude directories
find "$SOURCE_DIR" -maxdepth 1 -type f -name "*.txt" -exec cp {} "$BACKUP_DIR" \;

if [[ $? -ne 0 ]]; then
	    exit 102
fi

echo "Backup of .txt files completed successfully in $BACKUP_DIR"
