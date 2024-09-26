#!/bin/bash

# Define the source and destination directories
SOURCE_DIR="/mnt/c/Users/Vika2/Documents"
BACKUP_DIR="/mnt/c/Users/Vika2/backup"
BACKUP_FILE="documents_backup.tar.gz"

# Create the backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Check if the backup directory was created successfully
if [ $? -ne 0 ]; then
	    echo "Failed to create backup directory: $BACKUP_DIR"
	        exit 1
fi

# Compress the source directory into a tarball
echo "Starting backup of $SOURCE_DIR..."
tar -czvf "$BACKUP_DIR/$BACKUP_FILE" -C "$SOURCE_DIR" .

# Check if the tar command was successful
if [ $? -eq 0 ]; then
	    echo "Backup of $SOURCE_DIR completed and saved as $BACKUP_DIR/$BACKUP_FILE"
    else
	        echo "Backup failed"
		    exit 1
fi

