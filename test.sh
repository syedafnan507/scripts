#!/bin/bash
if [ $(id -u) -eq 0 ] ; then
	read -p "enter the username :" username
	read -s -p "enter the password :" password
	egrep "^$username" /etc/passwd > /dev/null
	if [ $? -eq 0 ]; then
		echo " $username exists"
		exit
	else
      # else 
			pass=$(perl -e 'print crypt ($ARGV[0],"password")' $password)
			useradd -m -p "$PASS" "$username"
			[ $? -eq 0 ] && echo "user has been added" || echo "faield to add user"
	fi
else
	echo " only root user can add a user"
fi

