#!/bin/bash
echo line 1
/bin/mount 172.17.42.1:/mnt/owncloud-data /var/lib/owncloud/data
echo line 2 
ls -l /var/lib/owncloud/data/
echo line 3
ls -l /var/lib/owncloud/
echo line 4
/usr/sbin/httpd -D FOREGROUND

