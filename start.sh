#!/bin/bash

mkdir /var/run/mysqld
mysqld_safe &

exec /usr/bin/redis-server

exec /usr/sbin/apache2ctl -D FOREGROUND

echo "Server started."
