#!bin/bash
echo "please enter your username::"
read -s USERNAME # if we remove (-s), then we can see the username while typing, otherwise can't 
echo "username entered: $USERNAME"
echo "please enter your password::"
read -s PASSWORD