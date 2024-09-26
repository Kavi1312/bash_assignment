#!/bin/bash
# This script displays information about the current user

# Get the username
USERNAME=$(whoami)

# Get the user ID
USER_ID=$(id -u)

# Get the group ID
GROUP_ID=$(id -g)

# Get the home directory
HOME_DIR=$HOME

# Get the shell being used
SHELL_USED=$SHELL

# Display the information
echo "Username: $USERNAME"
echo "User ID: $USER_ID"
echo "Group ID: $GROUP_ID"
echo "Home Directory: $HOME_DIR"
echo "Shell being used: $SHELL_USED"
