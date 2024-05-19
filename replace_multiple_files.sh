#!/bin/bash

# Variables
GITHUB_REPO="ANKUSHJAIN91/NCUpdateScripts"   # GitHub repository in the format username/repository
BRANCH="main"                               # Branch from which to download the files
FILES=("updated/routes.php" 
      "updated/NavigationManager.php" 
      "updated/development.notice.php"
      )  # Array of file paths in the repository
TARGET_DIRS=("/var/www/html/apps/settings/appinfo/" 
            "/var/www/html/lib/private/" 
            "/var/www/html/apps/settings/templates/settings/personal" 
            ) # Corresponding array of target directories

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

# Iterate over the arrays and download each file to its corresponding target directory
for i in "${!FILES[@]}"; do
  download_and_replace "${FILES[$i]}" "${TARGET_DIRS[$i]}"
done

exit 0
