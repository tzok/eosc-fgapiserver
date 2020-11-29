#!/bin/bash
while :; do
    echo 'Trying to connect to fgdb:3306'
    timeout 1 bash -c 'cat < /dev/null > /dev/tcp/fgdb/3306'
    if [[ $? -eq 0 ]]; then
        break
    fi
    sleep 3
done

exec catalina.sh run
