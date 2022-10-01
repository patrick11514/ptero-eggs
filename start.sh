#!/bin/ash
rm -rf /home/container/tmp/*

echo "Starting Nginx..."
echo "Successfully started"
/usr/sbin/nginx -c /home/webhost/nginx/nginx.conf -p /home/container/
