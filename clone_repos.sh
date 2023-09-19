#!/bin/bash
clone_folder="repos"
if [ -d "$clone_folder" ]; then
    rm -rf "$clone_folder"
fi
while IFS= read -r username; do

    repo_url="https://github.com/Utah-CS3550-Fall-2023/$username.git"
    git clone $repo_url $clone_folder/$username
    cd $clone_folder/$username

    ## !!!! READ ME: DEADLINE IS HARDCODED HERE !!!! ##
    ## !!!! ********CONVERT DEADLINE MDT TO UTC !!!! ##
    deadline="2023-09-11T00:00:00-06:00"
    latest_commit=$(git rev-list -1 --before="$deadline" HEAD)

    if [ -z "$latest_commit" ]; then
        echo "No commits found before $deadline for $username."
    else
        git checkout $latest_commit
        cd ../..
    fi

done < usernames.txt