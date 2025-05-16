#!/bin/bash
#Pull changes from the git repository
cd /var/www/html/UnixProject
git pull origin main
#Restart Nginx to apply changes
sudo systemctl restart ngninx

