#!/bin/bash
# This script creates a directory structure under the user's home directory
# Set the base directory path to the user's home directory
BASE_DIR="$HOME"

# Check if base directory exists
if [ ! -d "$BASE_DIR" ]; then
	    echo "Base directory $BASE_DIR does not exist."
	        exit 1
fi

# Create the projects directory and subdirectories
echo "Creating directory structure under $BASE_DIR..."
mkdir -p "$BASE_DIR/projects/project1"  # Creates project1 directory
mkdir -p "$BASE_DIR/projects/project2"  # Creates project2 directory
mkdir -p "$BASE_DIR/projects/project3"  # Creates project3 directory

# Create the documents directory
mkdir -p "$BASE_DIR/documents"  # Creates documents directory

# Create the downloads directory
mkdir -p "$BASE_DIR/downloads"  # Creates downloads directory

echo "Directory structure created successfully!"
