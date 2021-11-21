#!/bin/bash 

username=$1
directory=$2

function UserIsRoot { 
if [ $UID -eq 0 ];
then
echo "$username is root"
else
echo "$username is not root"
fi
}

function UserExists { 
if grep $username /etc/passwd
then 
echo "user exists"
else
echo "user doesn't exists"
fi
}


function DirExist {
if [ -d "$directory" ];
then
echo "Directory $directory exists"
else
echo "Directory $directory doesn't exists"
fi	
}

function ChangeOwner {
chown -R "$username:$username" "$directory"
}
exit

UserIsRoot
UserExists
DirExist
ChangeOwner
