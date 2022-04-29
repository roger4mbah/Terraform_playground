#!/bin/bash
sudo su
cd /var/www/html/
wget https://real-world-projects.s3.amazonaws.com/jjtech-streaming-application/jjtech-streaming-application-v1/jjtech-streaming-application-v1.zip
yum install -y unzip httpd
unzip jjtech-streaming-application-v1.zip
cp -rf jjtech-streaming-application-v1/* .
rm -rf jjtech-streaming-application-v1.zip __MACOSX/
systemctl enable --now httpd

