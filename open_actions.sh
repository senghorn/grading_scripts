#!/bin/bash

file="usernames.txt"

# Check if the file exists
if [ ! -f "$file" ]; then
    echo "File $file not found."
    exit 1
fi

while IFS= read -r username; do
    if [ -n "$username" ]; then
        start chrome "https://github.com/Utah-CS3550-Fall-2023/$username/actions"
    fi
done < "$file"
