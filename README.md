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


Copy code
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <directory>"
    exit 1
fi
Directory Existence Check:
The script verifies if the provided directory exists.

Copy code
if [ ! -d "$SOURCE_DIR" ]; then
    echo "The directory $SOURCE_DIR does not exist."
    exit 1
fi
Timestamp Creation:
The script creates a timestamp using the date command.

bash
Copy code
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
Backup Directory Creation:
A new directory (backup_<timestamp>) is created within the provided directory.

BACKUP_DIR="$SOURCE_DIR/backup_$TIMESTAMP"
mkdir -p "$BACKUP_DIR"
File Copying:
The script uses the find command to search for .txt files in the source directory and copies them into the backup directory.


find "$SOURCE_DIR" -maxdepth 1 -type f -name "*.txt" -exec cp {} "$BACKUP_DIR" \;
Error Handling:
Wrong Number of Arguments:
If the user doesn't provide exactly one directory as an argument, the script outputs usage information and exits.
Directory Doesn't Exist:
If the provided directory doesn't exist, the script outputs an error and exits.
Customization:
File Types:
To back up different file types (e.g., .log or .csv), change *.txt in the find command:
find "$SOURCE_DIR" -maxdepth 1 -type f -name "*.log" -exec cp {} "$BACKUP_DIR" \;
