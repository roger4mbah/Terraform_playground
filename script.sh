#!/bin/bash
sudo su
 yum install httpd -y
 systemctl enable --now httpd
 cd /var/www/html
 wget https://real-world-projects.s3.amazonaws.com/jjtech-streaming-application/jjtech-streaming-application-v1/jjtech-streaming-application-v1.zip
 unzip jjtech-streaming-application-v1.zip
 cp -rf jjtech-streaming-application-v1/* .
 rm -rf jjtech-streaming-application-v1.zip __MACOSX/
