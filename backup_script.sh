#!/bin/bash


backup_config_file="/archive/backup_config.txt"
backup_destination="/member"
backup_filename="backup_$(date +'%Y%m%d').tar.gz"
source_directory="/archive"

if [ -f "$backup_config_file" ];
then
        echo "Backup configuration file found. Let's do backup."
else
        echo "Backup configuration file not found. Let's Exit."
        exit 1
fi

source "$backup_config_file"

tar -czf "$backup_destination/$backup_filename" "$source_directory" 2>/dev/null

if [ $? -eq 0 ];
then
        echo "Backup completed successfully: $backup_destination/$backup_filename"
else
        echo "Backup failed. Please check for errors."
        exit 1
fi

