#!/bin/bash
if which node > /dev/null
then
    echo "Node is instaled, proceeding..."
    else
    echo "You need to install node v12 or newer"
    exit
fi
echo "Cloning from github"
git clone https://github.com/SerIgel/sova_bot.git
cd sova_bot
touch ./config.json
echo "Input command prefix:"
read prefix
echo "Input your bot token:"
read token
echo "Specify admin who can do specific actions such as adding teams and stuff"
read admin
echo "Input channel to take grouup roles in"
read ch
cat << EOF > ./config.json
{ 
    "prefix": "${prefix}", 
    "token": "${token}",
    "admin": "${admin}",
    "group_channel": ["${ch}"]
}
EOF
echo "Installing dependencies..."
npm install
echo "cd to ./sova_bot then npm start to start a bot"
