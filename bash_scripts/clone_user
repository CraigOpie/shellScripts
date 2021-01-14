#!/bin/bash

# clone a user
# usage:
# if you named this as below then
# change to the directory and run this command
# sudo bash clone-user.sh

echo "============="
echo "this script will create a new user"
echo "based on an existing user's data"
echo 
echo "You will be shown a list of users who can currently log on"
echo "Remember which user you would like to clone."
echo "You will be asked for the new user's name, their password"
echo "and the old user to clone".
echo "============="
echo 

echo -n "New user's name: "
read newuser

echo -n "New user's password: "
read newpassword

echo 

echo "Current users you can clone:"
echo "----"
awk -F'[/:]' '{if ($3 >= 1000 && $3 != 65534) print $1}' /etc/passwd
echo 

echo -n "Old user to clone: "
read olduser

echo 
echo "You have selected: "
echo "----"
echo "new user: $newuser"
echo "new user password: $newpassword"
echo "old user: $olduser"
echo 

olduser_GROUPS=$(id -Gn ${olduser} | sed "s/${olduser} //g" | sed "s/ ${olduser}//g" | sed "s/ /,/g")
olduser_SHELL=$(awk -F : -v name=${olduser} '(name == $1) { print $7 }' /etc/passwd)

echo "old user groups: "
echo "----"
echo $olduser_GROUPS
echo "olduser shell: "
echo $olduser_SHELL
read -rsp $'Press any key to continue or ctrl-c to exit...\n' -n1 key

useradd --groups $olduser_GROUPS --shell $olduser_SHELL $newuser

echo $newuser:$newpassword | chpasswd

read -rsp $'ready to make home direcoty -- ctrl-c to exit...\n' -n1 key

mkdir /home/$newuser
chown -R $newuser:$newuser /home/$newuser

echo 
echo "Script should be done now."
echo 
echo "Do you see your new users name below?"
echo 
awk -F'[/:]' '{if ($3 >= 1000 && $3 != 65534) print $1}' /etc/passwd

echo 
echo "We are now going to copy the old user's home folder to the new user"
echo "then change ownership to the new user"
echo 
read -rsp $'Ready to copy home folder --- or ctrl-c to exit...\n' -n1 key

rsync -aPv /home/$olduser/. /home/$newuser/
chown -R --from=$olduser $newuser:$newuser /home/$newuser

echo 
echo "Now we are going to change the names of files and folders to the new user"
echo 

grep -rlI $olduser /home/$newuser/ . | sudo xargs sed -i 's/$olduser/$newuser/g'

echo 
echo "Done now."
echo 
read -rsp $'Press any key to exit...\n' -n1 key
echo 
echo 
