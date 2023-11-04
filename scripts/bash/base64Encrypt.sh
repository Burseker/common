#/bin/sh

echo "Base64 login:password encoding"

read -p "Enter user login: " login
read -p "password: " -s password
echo
# base64 <( echo $login:$password )
echo $login:$password | base64