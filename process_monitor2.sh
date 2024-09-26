#!/bin/bash

LOG_FILE="/var/log/process_monitor.log"
PROCESS_NAME="apache2"

# Check if the process is running
if ! pgrep -x "$PROCESS_NAME" > /dev/null
then
	    echo "$(date): $PROCESS_NAME not running, starting it now." | sudo tee -a "$LOG_FILE"
	        sudo service "$PROCESS_NAME" start
	else
		    echo "$(date): $PROCESS_NAME is running." | sudo tee -a "$LOG_FILE"
fi
