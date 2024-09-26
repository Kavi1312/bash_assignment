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
