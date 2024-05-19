#!/bin/bash

# Variables
GITHUB_REPO="ANKUSHJAIN91/NCUpdateScripts"   # GitHub repository in the format username/repository
BRANCH="main"                       # Branch from which to download the file
FILE_PATH="updated/routes.php"    # Path to the file in the repository
TARGET_DIR="/var/www/html/apps/settings/appinfo/"    # Directory where the file should be replaced
TARGET_FILE="${TARGET_DIR}/$(basename $FILE_PATH)" # Construct target file path

# Check if target directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Target directory does not exist: $TARGET_DIR"
  exit 1
fi

# Download the file
echo "Downloading ${FILE_PATH} from ${GITHUB_REPO}..."
curl -o "$TARGET_FILE" -L "https://raw.githubusercontent.com/${GITHUB_REPO}/${BRANCH}/${FILE_PATH}"

# Verify download success
if [ $? -eq 0 ]; then
  echo "File successfully downloaded and replaced: $TARGET_FILE"
else
  echo "Failed to download file."
  exit 1
fi

exit 0
