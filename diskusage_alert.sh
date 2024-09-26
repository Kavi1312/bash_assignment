#!/bin/bash
# This script checks the disk usage of the root filesystem and sends an email alert if it exceeds 80%

# Set the threshold for disk usage
THRESHOLD=80

# Get the current disk usage of the root filesystem
CURRENT_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')

# Print current usage for debugging
echo "Current disk usage: $CURRENT_USAGE%"

# Check if the current usage exceeds the threshold
if [ "$CURRENT_USAGE" -gt "$THRESHOLD" ]; then
	    # Print a message indicating that the threshold has been exceeded
	        echo "Disk usage is above $THRESHOLD%. Sending email alert..."

		    # Send an email alert
		        echo "Disk usage is above $THRESHOLD%. Current usage is $CURRENT_USAGE%." | mail -s "Disk Usage Alert" your_email@example.com

			    # Check if the mail command was successful
			        if [ $? -eq 0 ]; then
					        echo "Email sent successfully."
						    else
							            echo "Failed to send email."
								        fi
								else
									    echo "Disk usage is below $THRESHOLD%. No email sent."
fi
