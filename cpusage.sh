#!/bin/bash

# File to save the report
output_file="system_report.txt"

# Get system uptime
uptime_info=$(uptime -p)

# Get memory usage
memory_info=$(free -h)

# Get CPU load
cpu_load=$(top -bn1 | grep "load average" | awk '{print $10 $11 $12}')

# Get disk usage
disk_usage=$(df -h)

# Get running processes
running_processes=$(ps aux --sort=-%mem | head -n 10)

# Write the report to the file
{
	    echo "System Information Report"
	        echo "========================="
		    echo ""
		        echo "System Uptime:"
			    echo "$uptime_info"
			        echo ""
				    echo "Memory Usage:"
				        echo "$memory_info"
					    echo ""
					        echo "CPU Load:"
						    echo "$cpu_load"
						        echo ""
							    echo "Disk Usage:"
							        echo "$disk_usage"
								    echo ""
								        echo "Top 10 Running Processes by Memory Usage:"
									    echo "$running_processes"
								    } > "$output_file"

								    echo "System information report saved to $output_file"
