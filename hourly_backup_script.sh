#!/bin/bash

backup_config_file="/archive/backup_config.txt"
backup_destination="/member"
hourly_dir="$backup_destination/$(date +'%Y-%m-%d %H-%M')"
backup_filename="$(date +'%Y%m%d_%H%M%S').tar.gz"
source_directory="/archive"

if [ -f "$backup_config_file" ];
then 
	echo "Backup configuration file found. Proceeding with the backup."
else
	echo "Backup configuration file not found. Exiting."
	exit 1
fi 

mkdir -p "$hourly_dir"

source "$backup_config_file"

tar -czf "$hourly_dir/$backup_filename" "$source_directory" 2>/dev/null

if [ $? -eq 0 ];
then 
	echo "Backup completed successfully: $hourly_dir/$backup_filename"
else
	echo "Backup was not successfull. Check for errors."
	exit 1 
fi 
