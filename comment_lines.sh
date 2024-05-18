#!/bin/bash

# Specify the target file
target_file="/var/www/html/apps/settings/appinfo/routes.php"

# Comment out the specified lines
sed -i '/AppSettings#listCategories/ { s/^/\/\/ /; t; }' "$target_file"
sed -i '/AppSettings#viewApps/ { s/^/\/\/ /; t; }' "$target_file"
sed -i '/AppSettings#listApps/ { s/^/\/\/ /; t; }' "$target_file"
sed -i '/AppSettings#enableApp/ { s/^/\/\/ /; t; }' "$target_file"
sed -i '/AppSettings#enableApp/ { s/^/\/\/ /; t; }' "$target_file"
sed -i '/AppSettings#enableApps/ { s/^/\/\/ /; t; }' "$target_file"
sed -i '/AppSettings#disableApp/ { s/^/\/\/ /; t; }' "$target_file"
sed -i '/AppSettings#disableApps/ { s/^/\/\/ /; t; }' "$target_file"
sed -i '/AppSettings#updateApp/ { s/^/\/\/ /; t; }' "$target_file"
sed -i '/AppSettings#uninstallApp/ { s/^/\/\/ /; t; }' "$target_file"
sed -i '/AppSettings#viewApps/ { s/^/\/\/ /; t; }' "$target_file"
sed -i '/AppSettings#viewApps/ { s/^/\/\/ /; t; }' "$target_file"
sed -i '/AppSettings#force/ { s/^/\/\/ /; t; }' "$target_file"
sed -i '/Help#help/ { s/^/\/\/ /; t; }' "$target_file"
sed -i '/Reasons#getPdf/ { s/^/\/\/ /; t; }' "$target_file"

echo "Lines commented out successfully!"
