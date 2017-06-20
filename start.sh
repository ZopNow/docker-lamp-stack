#!/bin/bash

mkdir /var/run/mysqld
mysqld_safe &

exec /usr/bin/redis-server

exec Xvfb &
exec java -jar ~/selenium/selenium.jar > /dev/null 2>&1 &

exec /usr/sbin/apache2ctl -D FOREGROUND

echo "Server started."
