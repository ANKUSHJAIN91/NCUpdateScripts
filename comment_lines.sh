#!/bin/bash

# Specify the target file
target_file="/var/www/html/apps/settings/appinfo/routes.php"

# Comment out the specified lines
sed -i '/AppSettings#listCategories/ s/^/\/\/ /' "$target_file"
sed -i '/AppSettings#viewApps/ s/^/\/\/ /' "$target_file"
# ... (repeat for other lines)

echo "Lines commented out successfully!"
