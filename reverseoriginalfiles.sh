#!/bin/bash

# Variables
GITHUB_REPO="ANKUSHJAIN91/NCUpdateScripts"   # GitHub repository in the format username/repository
BRANCH="main"                               # Branch from which to download the files
FILES=("original/routes.php" 
      "original/NavigationManager.php" 
      "original/development.notice.php"
      "original/overview.php"
      "original/additional-mail.php"
      )  # Array of file paths in the repository
TARGET_DIRS=("/var/www/html/apps/settings/appinfo/" 
            "/var/www/html/lib/private/" 
            "/var/www/html/apps/settings/templates/settings/personal" 
            "/var/www/html/apps/settings/templates/settings/admin"
            "/var/www/html/apps/settings/templates/settings/admin"
            ) # Corresponding array of target directories
# Arrays for directories and files to be removed
# REMOVE_DIRS=("/var/www/html/apps/firstrunwizard" )  # Directories to remove
# REMOVE_FILES=("/var/www/html/dist/federatedfilesharing-vue-settings-personal.js" 
#               "/var/www/html/dist/federatedfilesharing-vue-settings-personal.js.map"
#               "/var/www/html/dist/federatedfilesharing-vue-settings-admin.js"
#               "/var/www/html/dist/federatedfilesharing-vue-settings-admin.js.map"
#               "/var/www/html/dist/updatenotification-updatenotification.js.map"
#               "/var/www/html/dist/updatenotification-updatenotification.js"
#               "/var/www/html/dist/updatenotification-updatenotification.js.LICENSE.txt"
#               "/var/www/html/dist/settings-vue-settings-admin-basic-settings.js.map"
#               )  # Files to remove

# Check if the lengths of FILES and TARGET_DIRS arrays match
if [ ${#FILES[@]} -ne ${#TARGET_DIRS[@]} ]; then
  echo "Error: The number of files and target directories do not match."
  exit 1
fi

# Function to download and replace a file
download_and_replace() {
  local file_path=$1
  local target_dir=$2
  local target_file="${target_dir}/$(basename $file_path)"

  # Check if target directory exists
  if [ ! -d "$target_dir" ]; then
    echo "Target directory does not exist: $target_dir"
    exit 1
  fi

  echo "Downloading ${file_path} from ${GITHUB_REPO} to ${target_dir}..."
  curl -o "$target_file" -L "https://raw.githubusercontent.com/${GITHUB_REPO}/${BRANCH}/${file_path}"

  if [ $? -eq 0 ]; then
    echo "File successfully downloaded and replaced: $target_file"
  else
    echo "Failed to download file: $file_path"
    exit 1
  fi
}

# Function to remove directories
# remove_directories() {
#   for dir in "${REMOVE_DIRS[@]}"; do
#     if [ -d "$dir" ]; then
#       echo "Removing directory: $dir"
#       rm -rf "$dir"
#       if [ $? -eq 0 ]; then
#         echo "Directory successfully removed: $dir"
#       else
#         echo "Failed to remove directory: $dir"
#         exit 1
#       fi
#     else
#       echo "Directory does not exist: $dir"
#     fi
#   done
# }

# # Function to remove files
# remove_files() {
#   for file in "${REMOVE_FILES[@]}"; do
#     if [ -f "$file" ]; then
#       echo "Removing file: $file"
#       rm -f "$file"
#       if [ $? -eq 0 ]; then
#         echo "File successfully removed: $file"
#       else
#         echo "Failed to remove file: $file"
#         exit 1
#       fi
#     else
#       echo "File does not exist: $file"
#     fi
#   done
# }

# # Remove specified directories and files
# remove_directories
# remove_files

# Iterate over the arrays and download each file to its corresponding target directory
for i in "${!FILES[@]}"; do
  download_and_replace "${FILES[$i]}" "${TARGET_DIRS[$i]}"
done

exit 0
