#!/bin/bash

username=""
password=""

while [[ $# -gt 0 ]]; do
  key="$1"
  
  case $key in
    --username)
      username="$2"
      shift
      ;;
    --password)
      password="$2"
      shift
      ;;
    *) 
      ;;
  esac
  
  shift
done


if [[ -z $username ]]; then
  read -p "username: " username
fi

if [[ -z $password ]]; then
  read -p "password: " -s password
  echo
fi

docker volume create remmina_config

docker run -d \
  --name=remmina \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=Asia/Taipei \
  -e CUSTOM_USER=$username \
  -e PASSWORD=$password \
  -p 3000:3000 \
  -p 3001:3001 \
  -v remmina_config:/config \
  --restart unless-stopped \
  remmina:dev
