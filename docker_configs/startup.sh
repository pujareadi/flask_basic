#!/bin/bash
echo "starting bash command"
service start nginx
/usr/local/bin/circusd /var/www/app/docker_configs/circus.conf