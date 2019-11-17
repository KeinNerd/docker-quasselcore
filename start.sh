#!/bin/bash

# Generating a ssl certificate on first run
echo "Generating a ssl certificate on first run"
if [ ! -f /config/quasselCert.pem ]
then
    openssl req -x509 -subj "/C=aa/ST=aa/L=a/O=a/CN=a" -nodes -days 365 -newkey rsa:4096 -keyout /config/quasselCert.pem -out /config/quasselCert.pem
fi

# start quasselcore
echo "start quasselcore"
/usr/local/bin/quasselcore --port=4242 --configdir=/config/
