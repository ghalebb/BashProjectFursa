#!/bin/bash

# Greet the user
echo "Hello $USER"

# Define environment variable COURSE_ID
export COURSE_ID=DevOpsFursa

# Check permissions of .token file if it exists
if [ -f "$HOME/.token" ]; then
    token_perms=$(stat -c "%a" "$HOME/.token")
    if [ "$token_perms" != "600" ]; then
        echo "Warning: .token file has too open permissions"
    fi
fi

# Change umask
umask 0006

# Add /home/<username>/usercommands to PATH
export PATH="$PATH:/home/$USER/usercommands"

# Print current date in ISO 8601 format
echo "The current date is: $(date -u +%FT%T%z)"

# Define command alias for ltxt
alias ltxt='ls *.txt'

# Create or clean ~/tmp directory
if [ -d "$HOME/tmp" ]; then
    rm -rf "$HOME/tmp"/*
else
    mkdir "$HOME/tmp"
fi

# Kill process bound to port 8080 if it exists
kill $(lsof -t -i:8080) 2>/dev/null
