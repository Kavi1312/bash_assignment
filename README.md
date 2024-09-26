

1. Create a Directory Structure:
Write a script that creates the following directory structure:
   /home/user/
       ├── projects/
       │   ├── project1/
       │   ├── project2/
       │   └── project3/
       ├── documents/
       └── downloads/

folders Created:
projects/:
Contains three subdirectories: project1/, project2/, and project3/.
documents/:
General directory for storing user documents.
downloads/:
General directory for storing downloaded files.
Prerequisites
Ensure that you have:
Bash installed (which is standard on most Linux systems).
Correct permissions to create directories in the target location (typically, the /home/user/ directory).
Script Usage:-Clone or download the script to your local machine.
Run the script using the following command:
bash
Copy code
bash create_directories.sh
Explanation:
The script dynamically uses the current user’s home directory (i.e., /home/$USER).
It creates the projects, documents, and downloads directories.
Inside the projects folder, three subfolders are created: project1, project2, and project3.
The mkdir -p command is used to create parent directories if they don't exist.
Customizing the Script
If you want to customize the directory names or paths:
Modify the base_dir variable to set a different base directory.
Example: base_dir="/path/to/custom/directory"
You can add more project folders or modify existing ones by changing the mkdir -p commands.
Troubleshooting
Permission Denied: Ensure you have the appropriate permissions to create directories in /home/user/.
Directory already exists: The mkdir -p command won't report an error if the directories already exist.


2. File Backup:
Write a script that takes a directory as an argument and creates a backup of all `.txt` files in that directory. The backup files should be copied to a new directory named `backup` with a timestamp.

This will create a backup of all .txt files in the /home/user/documents directory and store them in a new folder inside documents/ named backup_<timestamp>.

Expected Output:
If the directory exists and contains .txt files, a new backup directory will be created with the copied .txt files.
If the directory does not exist, you will receive an error message.
Understanding the Script:
Argument Check:
The script checks if exactly one argument (a directory path) is provided.
Directory Existence Check:
The script verifies if the provided directory exists.
Timestamp Creation:
The script creates a timestamp using the date command.

TIMESTAMP=$(date +"%Y%m%d%H%M%S")
Backup Directory Creation:
A new directory (backup_<timestamp>) is created within the provided directory.
File Copying:
The script uses the find command to search for .txt files in the source directory and copies them into the backup directory.

Error Handling:
Wrong Number of Arguments:
If the user doesn't provide exactly one directory as an argument, the script outputs usage information and exits.
Directory Doesn't Exist:
If the provided directory doesn't exist, the script outputs an error and exits.
Customization:
File Types:
To back up different file types (e.g., .log or .csv), change *.txt in the find command:
find "$SOURCE_DIR" -maxdepth 1 -type f -name "*.log" -exec cp {} "$BACKUP_DIR" \;


3. User Information:
Write a script that displays the following information about the user:
   - Username
   - User ID
   - Group ID
   - Home Directory
User Information Script
This Bash script displays information about the current user, including:
Username
User ID
Group ID
Home Directory
Shell being used
The script collects information about the current user by using system commands such as whoami, id, and environment variables like $HOME and $SHELL. It then prints this information in a readable format.
In nano, press Ctrl + O to save, then Ctrl + X to exit.
Step 2: Make the Script Executable
Run the following command to make the script executable:
chmod +x user_info.sh
This command gives the script permission to be executed.
Step 3: Run the Script
To run the script, enter the following command:
./user_info.sh
Example Output:
When the script runs, it will output something like this:
Username: your-username
User ID: 1000
Group ID: 1000
Home Directory: /home/your-username
Shell being used: /bin/bash
Explanation of the Script
whoami:
Retrieves the current username of the logged-in user.
USERNAME=$(whoami)
id -u:
Retrieves the user ID of the logged-in user.
USER_ID=$(id -u)
id -g:
Retrieves the group ID of the logged-in user.
GROUP_ID=$(id -g)
$HOME:
Retrieves the home directory of the user using the $HOME environment variable.
HOME_DIR=$HOME
$SHELL:
Retrieves the default shell being used by the user using the $SHELL environment variable.
SHELL_USED=$SHELL
Customization:
You can modify the script to display other information about the user or system (e.g., the user’s groups, or system uptime) by using additional commands like id -G, uptime, etc.
Troubleshooting:
Permission Denied: If you get a "permission denied" error while running the script, ensure you ran the chmod +x user_info.sh command to make the script executable.
Command Not Found: If you encounter "command not found" errors, make sure you're running the script in a Linux or Unix environment with the correct tools installed.
The script collects information about the current user by using system commands such as whoami, id, and environment variables like $HOME and $SHELL. It then prints this information in a readable format.
Use a text editor like nano or vi to create the script file:
Step 1: Make the Script Executable
Run the following command to make the script executable:
chmod +x user_info.sh
This command gives the script permission to be executed.
Step 2 Run the Script
To run the script, enter the following command:
./user_info.sh
Example Output:
When the script runs, it will output something like this:
Username: your-username
User ID: 1000
Group ID: 1000


4. Disk Usage Alert:
Write a script that checks the disk usage of the root filesystem. If the disk usage is above 80%, the script should send an email alert to the system administrator.
xplanation of the Code:
Shebang (#!/bin/bash): The script starts with #!/bin/bash, which is called the "shebang." This tells the system that the script should be run using the Bash shell.
#!/bin/bash
Setting the Threshold: The THRESHOLD variable is set to 80. This is the disk usage percentage at which the script will trigger an alert. If the disk usage is higher than 80%, an email will be sent.
THRESHOLD=80
Getting the Current Disk Usage: The script uses the df (disk free) command to get the current disk usage of the root filesystem (/), then filters out the percentage value using the grep, awk, and sed commands.
CURRENT_USAGE=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
df /:
This command checks the disk usage of the root filesystem (/). The output will look something like this:
Filesystem     1K-blocks    Used Available Use% Mounted on
/dev/sda1      102400000 80400000 22000000 80% /
grep /:
This filters the output to only show the line that starts with / (the root filesystem).
awk '{ print $5 }':
This extracts the 5th column of the output, which is the disk usage percentage (e.g., 80%).
sed 's/%//g':
This removes the percentage sign (%) from the result so that we are left with just the number (e.g., 80).
Print Current Usage: For debugging purposes, the script prints the current disk usage. This helps you know what the disk usage is when the script runs.
echo "Current disk usage: $CURRENT_USAGE%"
Checking If the Threshold Is Exceeded: The if statement checks if the current disk usage exceeds the threshold (80%). If CURRENT_USAGE is greater than THRESHOLD, it proceeds to send an email alert.
if [ "$CURRENT_USAGE" -gt "$THRESHOLD" ]; then
-gt:
This means "greater than." It checks if CURRENT_USAGE is greater than THRESHOLD.
Printing the Alert Message: If the disk usage is above the threshold, the script prints a message to the terminal saying it’s about to send an email alert.
echo "Disk usage is above $THRESHOLD%. Sending email alert..."
Sending the Email: The script sends an email to the system administrator using the mail command. The message includes the current disk usage percentage, and the subject of the email is "Disk Usage Alert."
echo "Disk usage is above $THRESHOLD%. Current usage is $CURRENT_USAGE%." | mail -s "Disk Usage Alert" your_email@example.com
echo:
This outputs a message about the disk usage.



5. File Permission Checker:
Write a script that takes a file as an argument and checks if the file has read, write, and execute permissions. The script should display appropriate messages for each permission.

Disk Usage Check:
The script checks the disk usage of the root (/) filesystem using the df command.
Threshold:
The script compares the current disk usage with a pre-defined threshold (set to 80% by default).
Alert:
If the current disk usage exceeds the threshold, an email alert is sent to the system administrator.
Loggng:
The script also prints relevant information to the terminal about the current disk usage and whether an email was sent.
To run the script automatically at regular intervals (e.g., daily), you can schedule it using cron:
Open the crontab editor:
crontab -e
Add a line like this to run the script every day at 8:00 AM:
0 8 * * * /path/to/disk_usage_alert.sh
Replace /path/to/disk_usage_alert.sh with the actual path to your script.



6. Automated Backup:
Write a script that compresses the `/home/user/documents` directory into a tarball named `documents_backup.tar.gz` and moves it to the `/home/user/backup` directory. This script should be scheduled to run daily using cron.
for above:- Explanation of Changes:
Progress Messages:
Added echo "Starting backup of $SOURCE_DIR..." to indicate when the backup process starts.
Error Handling:
After creating the backup directory, the script checks if the mkdir command was successful using if [ $? -ne 0 ]; then .... If it wasn’t, it prints an error message and exits.
After the tar command, the script checks if the command was successful using if [ $? -eq 0 ]; then .... If it was, it prints a success message; otherwise, it prints a failure message and exits.
Running the Script
When you run this updated script, you should see messages indicating the start of the backup process and whether it completed successfully or failed. This will help you know if the backup was completed.

7. Process Monitor:
Write a script that checks if a specific process (e.g., `apache2`) is running. If the process is not running, the script should start the process and log the action to a file.
Define the process name and log file:
PROCESS_NAME is set to apache2.
LOG_FILE is set to /var/log/process_monitor.log.
Check if the process is running:
The pgrep "$PROCESS_NAME" command checks if the process is running. If it is, a message is logged indicating that the process is running.
If the process is not running, a message is logged, and the script attempts to start the process using systemctl start "$PROCESS_NAME".
Log the action:
The script logs whether the process was successfully started or if the attempt failed.
Running the Script
To run this script, save it to a file (e.g., process_monitor.sh), make it executable with chmod +x process_monitor.sh, and then execute it with ./process_monitor.sh.
efine Variables:
LOG_FILE="/var/log/process_monitor.log"
PROCESS_NAME="apache2"
LOG_FILE is the path to the log file where the script will record its actions.
PROCESS_NAME is the name of the process you want to monitor, in this case, apache2.
Check if the Process is Running:
if ! pgrep -x "$PROCESS_NAME" > /dev/null
pgrep -x "$PROCESS_NAME" checks if a process with the exact name apache2 is running.
> /dev/null discards the output of pgrep.
! negates the condition, so the if statement is true if pgrep does not find the process.
If the Process is Not Running:
then
    echo "$(date): $PROCESS_NAME not running, starting it now." | sudo tee -a "$LOG_FILE"
    sudo service "$PROCESS_NAME" start
echo "$(date): $PROCESS_NAME not running, starting it now." prints a message with the current date and time.
| sudo tee -a "$LOG_FILE" appends this message to the log file with elevated permissions.
sudo service "$PROCESS_NAME" start starts the apache2 service using sudo to ensure it has the necessary permissions.
If the Process is Running:
else
    echo "$(date): $PROCESS_NAME is running." | sudo tee -a "$LOG_FILE"
fi
echo "$(date): $PROCESS_NAME is running." prints a message with the current date and time.
| sudo tee -a "$LOG_FILE" appends this message to the log file with elevated permissions.
Summary
The script checks if the apache2 process is running.
If it is not running, it logs this event and starts the process.
If it is running, it logs that the process is already running.
Running the Script
To run this script, you need to use sudo to ensure it has the necessary permissions to write to the log file:
sudo ./process_monitor.sh

8. Text File Analysis:
Write a script that takes a text file as an argument and counts the number of lines, words, and characters in the file. The script should display the counts.
Ensure the script is in the correct directory:
Verify that count_file_contents.sh is indeed in the directory you are navigating to. You can list the files in the directory using:
ls
Navigate to the correct directory:
Make sure you are in the directory where the script is saved. For example, if your script is saved in C:\Users\Vika2\Documents\scripts, you should navigate to that directory in Git Bash or WSL:
cd /mnt/c/Users/Vika2/Documents/scripts
Run the script from the correct directory:
Once you are in the correct directory, run the script with the path to your text file:
./count_file_contents.sh /mnt/c/Users/Vika2/Documents/day2.txt
Example Steps:
Assuming your script is saved in C:\Users\Vika2\Documents\scripts:
Open Git Bash or WSL.
Navigate to the directory where the script is saved:
cd /mnt/c/Users/Vika2/Documents/scripts
Make the script executable (if you haven’t already):
chmod +x count_file_contents.sh
Run the script with the path to your text file:
./count_file_contents.sh /mnt/c/Users/Vika2/Documents/day2.txt

 9.System Information Report:
Write a script that generates a system information report. The report should include:
   - System uptime
   - Memory usage
   - CPU load
   - Disk usage
   - Running processes
Setting the Output File
output_file="system_report.txt"
output_file is a variable that stores the name of the file where the system report will be saved.
All collected system information will be written to this file.
 Get System Uptime
uptime_info=$(uptime -p)
uptime command shows how long the system has been running.
-p flag makes the output more human-readable (e.g., "up 5 hours, 30 minutes").
The result is stored in the variable uptime_info.
Get Memory Usage
memory_info=$(free -h)
free -h displays the system's memory usage, showing total, used, and available memory in human-readable format (-h flag).
The information is stored in the variable memory_info.
 Get CPU Load
cpu_load=$(top -bn1 | grep "load average" | awk '{print $10 $11 $12}')
top command provides real-time system stats, including CPU load averages.
-b runs top in batch mode, and -n1 limits it to one iteration.
grep "load average" filters the output to only include the load average line.
awk '{print $10 $11 $12}' extracts the last three fields, which are the 1-minute, 5-minute, and 15-minute CPU load averages.
The result is stored in the variable cpu_load.
 Get Disk Usage
disk_usage=$(df -h)
df -h displays the current disk usage of mounted filesystems in a human-readable format (-h flag).
The output includes the total size, used space, available space, and usage percentage.
The result is stored in the variable disk_usage.
 Get Running Processes (Top 10 by Memory Usage)
running_processes=$(ps aux --sort=-%mem | head -n 10)
ps aux displays all running processes along with detailed information like CPU and memory usage.
--sort=-%mem sorts the processes by memory usage in descending order (largest memory usage first).
head -n 10 limits the output to the top 10 processes.
The result is stored in the variable running_processes.
 Writing the System Information to the Report File
The script uses a block ({ ... }) to write all the system information into the file (system_report.txt).
The echo commands are used to format the report with headings like "System Uptime," "Memory Usage," etc., and display the content stored in the variables ($uptime_info, $memory_info, etc.).
The > operator writes the output to the file specified in $output_file (system_report.txt), overwriting the file if it already exists.
 Output Message After Saving the Report
echo "System information report saved to $output_file"
After successfully generating the report, this message is displayed in the terminal, informing the user that the system information has been saved to the file.
ummary of the Collected Information:
System Uptime: Shows how long the system has been running.
Memory Usage: Displays total, used, and free memory.
CPU Load: Shows system load averages for the past 1, 5, and 15 minutes.
Disk Usage: Displays disk usage for all mounted file systems.
Top 10 Running Processes: Lists the top 10 processes consuming the most memory.



10. Simple Calculator:
Write a script that acts as a simple calculator. The script should prompt the user to enter two numbers and an operator (+, -, *, /) and then display the result of the operation.
Prerequisites
The script relies on the bc command, which is a command-line calculator that supports basic arithmetic and floating-point calculations. It is available by default in most Linux distributions.
check if bc is installed by running:
bc --version
If bc is not installed, you can install it using:
On Ubuntu/Debian:
sudo apt install bc
On CentOS/Fedora:
sudo yum install bc
The main logic of the script is inside the calculate() function. This function takes three arguments:
The first number ($1)
The operator ($2)
The second number ($3)
Based on the operator, the function performs a calculation using the bc command, which allows for floating-point arithmetic.
 case "$2": This checks the value of the operator ($2).
Addition (+): If the operator is +, it performs an addition.
Subtraction (-): If the operator is -, it performs a subtraction.
Multiplication (*): If the operator is *, it multiplies the two numbers. The '*' is quoted to avoid special interpretation by the shell.
Division (/): If the operator is /, it checks whether the second number is zero (to avoid division by zero). If the second number is not zero, it performs division with 2 decimal points precision (scale=2).
Invalid Operator (*): If the operator is not one of the supported operators, it returns an "Invalid operator" message and exits.
3. User Input
The script prompts the user to input the two numbers and the operator.
4. Calling the calculate() Function
After the user inputs the numbers and the operator, the script calls the calculate function with the provided values.
calculate "$num1" "$operator" "$num2"
The three variables ($num1, $operator, and $num2) are passed as arguments to the calculate() function to perform the calculation.
5. Result Display
Once the calculation is done, the script prints the result:
echo "Result: $result"
If the calculation is successful, it shows the result; otherwise, it displays an error message (for invalid operators or division by zero).
How to Use
Make the Script Executable: Before you run the script, make sure it has execute permissions.
Run the following command in your terminal:
bash
Copy code
chmod +x caln.sh
Run the Script:
Use the following command to run the script:
bash
Copy code
./calndr.sh
Input:
the script will ask you for:
The first number: Any valid integer or decimal number.
The operator: One of the following arithmetic operators: +, -, *, /.
The second number: Any valid integer or decimal number.
Example Usage:
enter the first number: 5
Enter the operator (+, -, *, /): *
Enter the second number: 3
Result: 15
Error Handling:
Invalid operator: If you input an operator other than +, -, *, or /, the script will display "Invalid operator".
Division by zero: If you try to divide by zero, the script will display an error message.

