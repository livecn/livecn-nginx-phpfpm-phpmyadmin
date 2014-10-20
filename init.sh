#!/bin/bash
sed -i "s/\(AllowNoPassword']\s*=\s\)''/\1true/g" /etc/phpMyAdmin/config.inc.php
sed -i "s/\(host']\s*=\s'\)localhost/\1"$MARIADB_PORT_3306_TCP_ADDR"/g" /etc/phpMyAdmin/config.inc.php
sed -i "s/port']\s*=\s'/\0"$MARIADB_PORT_3306_TCP_PORT"/g" /etc/phpMyAdmin/config.inc.php

/usr/sbin/php-fpm &
/usr/sbin/nginx
