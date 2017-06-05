#!/bin/bash

mkdir /var/run/mysqld
mysqld_safe &

exec /usr/sbin/apache2ctl -D FOREGROUND

echo "Server started. Go to http://localhost in your browser."
