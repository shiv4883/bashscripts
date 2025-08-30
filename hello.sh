#!/bin/bash
echo "Hello, Devops"

# write a greeting

echo "Hello, $(whoami)"

# check execution permission for owner
if [ -x "$0" ]; then
 echo "you have execute permission on this script"
else 
 echo "Warning: you don't have execute permission"
fi

