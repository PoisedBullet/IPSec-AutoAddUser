#!/bin/sh
echo "Tell me a name for the user"
echo "Please, use one word only with no special characters."
read -r USER #Gets the username from user input
echo "What password should they have?"
read -r PASSWORD #Gets the password from user input
PASSENC="$(openssl passwd -1 $PASSWORD)" #Salts the password
cd /etc/ipsec.d
echo "$USER:$PASSENC:xauth-psk" >> passwd 
cd /etc/ppp/
echo "\"$USER\" l2tpd \"$PASSWORD\" *" >> chap-secrets
