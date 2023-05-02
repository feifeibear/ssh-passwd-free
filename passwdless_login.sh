#!/bin/bash

if [ $# -eq 0 ]; then
  echo "Usage: $0 <ip_list_file>"
  exit 1
fi

if [ ! -f ~/.ssh/id_rsa ]; then
  ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
fi

# root passwd
PASSWD=$2

# set ssh passwd-free
while read ip
do
  echo "Configuring passwordless login for $ip"
  expect -c "
    spawn ssh-copy-id -i /root/.ssh/id_rsa.pub root@$ip
    expect {
      \"yes/no\" { send \"yes\r\"; exp_continue }
      \"password:\" { send \"${PASSWD}\r\"; exp_continue }
      eof
    }
  "
done < "$1"
