#!/bin/bash
# This script demonstrates testing to see if 2 strings are the same

# TASK 1: Improve it by asking the user for a password guess instead of using inline literal data
# TASK 2: Improve it by rewriting it to use the if command
# TASK 3: Improve it by giving them 3 tries to get it right before failing (test 3 times but only if necessary)
#           *** Do not use the exit command

#Asking user for password guesse

read -p "Guess the password:" userstr
customstr="password"
i=1
while [ $i -lt 3 ]
do
  if [ $userstr != $customstr ]
  then
  {
    echo "Ooops! Try again"
    read -p "Guess the password:" userstr
  }
else
    {
      echo "Sucess"
      break
    }
  fi
  i=$(( $i + 1 ))
done
echo "The right passwrd is $customstr"
